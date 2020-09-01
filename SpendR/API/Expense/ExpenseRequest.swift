//
//  ExpenseRequest.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

struct ExpenseRequest {

    private let router = Router<ExpenseAPI>()

    func createExpense(expense: Expense, completion: @escaping NetworkRouterCompletion) {
        router.request(.createExpense(expense: expense), completion: completion)
    }

    func fetchExpenses(completion: @escaping NetworkRouterCompletion) {
        router.request(.fetchExpenses, completion: completion)
    }

    func deleteExpense(with expenseId: String, completion: @escaping NetworkRouterCompletion) {
        router.request(.deleteExpense(expenseId: expenseId), completion: completion)
    }
}
