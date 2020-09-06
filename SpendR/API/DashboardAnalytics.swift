//
//  DashboardAnalytics.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 06/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

protocol DashboardAnalyticsDelegate: class {
    func didUpdateTotal(billCount: Int)
    func didUpdateExpense(spendCount: Int, recent: [Expense], topTag: TopTagSpend)
}

typealias TaskCompletion = () -> Void
typealias TagSpend = (name: String, amount: Int)
typealias TopTagSpend = (first: TagSpend?, second: TagSpend?, third: TagSpend?)

class DashboardAnalytics {

    private var bills = [Bill]()
    private var expenses = [Expense]()

    private var billCount: Int { bills.count }
    private var totalSpend: Int { calculateExpenseTotal(expenses: expenses) }
    private var topTagSpend: TopTagSpend { calculateTopCategorySpend(expenses: expenses)}

    weak var delegate: DashboardAnalyticsDelegate?

    func load() {
        fetchBills { [weak self] in
            guard let self = self else { return }
            self.delegate?.didUpdateTotal(billCount: self.billCount)
        }
        fetchExpenses {  [weak self] in
            guard let self = self else { return }
            self.delegate?
                .didUpdateExpense(spendCount: self.totalSpend, recent: self.expenses, topTag: self.topTagSpend)
        }
    }

    private func calculateExpenseTotal(expenses: [Expense]) -> Int {
        return expenses.reduce(0, { $0 + $1.amount })
    }

    private func calculateTopCategorySpend(expenses: [Expense]) -> TopTagSpend {
        return (nil, nil, nil)
    }

    private func fetchExpenses(completion: @escaping TaskCompletion) {
        let request = ExpenseRequest()
        request.fetchExpenses { result in
            switch result {
            case .success(let response):
                let expenses = response?.documents.compactMap({ try? $0.data(as: Expense.self) })
                self.expenses = expenses ?? []
                self.expenses = self.expenses.sorted { $0.createdAt.dateValue() > $1.createdAt.dateValue() }
            case .failure:
                break
            }
            completion()
        }
    }

    private func fetchBills(completion: @escaping TaskCompletion) {
        let request = BillRequest()
        request.fetchBill { result in
            switch result {
            case .success(let response):
                let bills = response?.documents.compactMap({ try? $0.data(as: Bill.self) })
                self.bills = bills ?? []
            case .failure:
                break
            }
            completion()
        }
    }
}
