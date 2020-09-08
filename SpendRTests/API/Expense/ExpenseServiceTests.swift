//
//  ExpenseServiceTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
import Firebase
@testable import SpendR

class ExpenseServiceTests: XCTestCase {

    // MARK:-
    var expense: Expense!
    var sut: ExpenseService!
    var asyncDelegate: ExpenseServiceAsyncDelegate!

    // MARK: - Setup
    override func setUp() {
        asyncDelegate = ExpenseServiceAsyncDelegate()
        sut = ExpenseService(delegate: asyncDelegate)
        expense = Expense(name: "FIFA 21", amount: 15000, tag: nil)
    }

    override func tearDown() {
        expense = nil
        sut = nil
        asyncDelegate = nil
    }

    // MARK: - Conditions
    func userIsLoggedIn(completion: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: "tomisin18@gmail.com", password: "password", completion: completion)
    }

    func userIsLoggedOut(completion: @escaping () -> Void) {
        userIsLoggedIn { _, _ in
            try! Auth.auth().signOut()
            completion()
        }
    }

    // MARK: - Create
    func test_createExpense_loggedOutUser() {
        // given
        userIsLoggedOut {
            self.sut.create(expense: self.expense)
        }
        // then
        let exp = expectation(description: "User is not auhtenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.expenseRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_createexpense_loggedInUser() {
        // given
        userIsLoggedIn { _, _ in
            self.sut.create(expense: self.expense)
        }
        // then
        let exp = expectation(description: "Created expense successfully")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.expenseRequestServiceResult == true)
        }
    }

    // MARK: - Fetch
    func test_fetchExpense_loggedOutUser() {
        // given
        userIsLoggedOut {
            self.sut.fetchExpenses()
        }
        // then
        let exp = expectation(description: "User is not authenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.expenseRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_fetchExpense_loggedInUser() {
        // given
        userIsLoggedIn { _, _ in
            self.sut.fetchExpenses()
        }
        // then
        let exp = expectation(description: "Fetched expenses successfully")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.expenseRequestServiceResult == true)
        }
    }

    // MARK: - Delete
    func test_deleteexpense_loggedOutUser() {
        // given
        let expenseId = "123"
        // when
        userIsLoggedOut {
            self.sut.deleteExpense(with: expenseId)
        }
        // then
        let exp = expectation(description: "User is not authenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.expenseRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_deleteExpense_loggedInUser() {
        // given
        let expenseId = "123"
        // when
        userIsLoggedIn { _, _ in
            self.sut.deleteExpense(with: expenseId)
        }
        // then
        let exp = expectation(description: "Deleted expense with specified id")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.expenseRequestServiceResult == true)
        }
    }
}
