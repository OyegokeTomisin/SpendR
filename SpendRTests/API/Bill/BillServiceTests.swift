//
//  BillServiceTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
import Firebase
@testable import SpendR

class BillServiceTests: XCTestCase {

    // MARK: -
    var bill: Bill!
    var sut: BillService!
    var asyncDelegate: BillServiceAsyncDelegate!

    // MARK: - Setup
    override func setUp() {
        asyncDelegate = BillServiceAsyncDelegate()
        sut = BillService(delegate: asyncDelegate)
        bill = Bill(name: "Fifa 21", amount: 500, date: Date(), tag: nil)
    }

    override func tearDown() {
        bill = nil
        sut = nil
        asyncDelegate = nil
    }

    // MARK:- Conditions
    func userIsLoggedIn(completion: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: "tomisin18@gmail.com", password: "password", completion: completion)
    }

    func userIsLoggedOut(completion: @escaping ()->()) {
        userIsLoggedIn { _, _ in
            try! Auth.auth().signOut()
            completion()
        }
    }

    // MARK:- Create
    func test_createbill_loggedOutUser() {
        // given
        userIsLoggedOut {
            self.sut.create(bill: self.bill)
        }
        // then
        let exp = expectation(description: "User is not auhtenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.billRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_createbill_loggedInUser() {
        // given
        userIsLoggedIn { _, _ in
            self.sut.create(bill: self.bill)
        }
        // then
        let exp = expectation(description: "Created bill successfully")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.billRequestServiceResult == true)
        }
    }

    // MARK:- Fetch
    func testFetchbill_loggedOutUser() {
        // given
        userIsLoggedOut {
            self.sut.fetchBills()
        }
        // then
        let exp = expectation(description: "User is not authenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.billRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func testFetchbill_loggedInUser() {
        // given
        userIsLoggedIn { _, _ in
            self.sut.fetchBills()
        }
        // then
        let exp = expectation(description: "Fetched bills successfully")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.billRequestServiceResult == true)
        }
    }

    // MARK:- Delete
    func test_deletebill_loggedOutUser() {
        // given
        let billId = "123"
        userIsLoggedOut {
            self.sut.deleteBill(with: billId)
        }
        // then
        let exp = expectation(description: "User is not authenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.billRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_deletebill_loggedInUser() {
        // given
        let billId = "123"
        userIsLoggedIn { _, _ in
            self.sut.deleteBill(with: billId)
        }
        // then
        let exp = expectation(description: "Deleted bill with specified id")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.billRequestServiceResult == true)
        }
    }
}
