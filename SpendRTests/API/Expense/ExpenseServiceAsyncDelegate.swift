//
//  ExpenseServiceAsyncDelegate.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class ExpenseServiceAsyncDelegate: ExpenseServiceDelegate {

    // MARK: -
    var expenseRequestServiceResult: Bool?
    var expenseRequestServiceError: String?
    var asyncExpectation: XCTestExpectation?

    // MARK: -
    func didCompleteRequestWithSuccess(expenses: [Expense]?) {
        asyncExpectation?.fulfill()
        expenseRequestServiceResult = true
    }

    func didCompleteRequestWithFailure(error: String) {
        asyncExpectation?.fulfill()
        expenseRequestServiceError = error
        expenseRequestServiceResult = false
    }
}
