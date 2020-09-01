//
//  ExpenseService.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

struct ExpenseService {
    
    private let request = ExpenseRequest()
    weak var delegate: ExpenseServiceDelegate?
    
    func create(expense: Expense) {
        request.createExpense(expense: expense) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess(expenses: nil)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }
    
    func fetchExpenses() {
        request.fetchExpenses { result in
            switch result {
            case .success(let response):
                let expenses = response?.documents.compactMap({ try? $0.data(as: Expense.self) })
                self.delegate?.didCompleteRequestWithSuccess(expenses: expenses)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }
    
    func deleteExpense(with id: String) {
        request.deleteExpense(with: id) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess(expenses: nil)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }
}
