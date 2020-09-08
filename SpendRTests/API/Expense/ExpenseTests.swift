//
//  ExpenseTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class ExpenseTests: XCTestCase {

    // MARK: -
    var sut: Expense!

    // MARK: - Setup
    override func setUp() {

    }

    override func tearDown() {
        sut = nil
    }

    // MARK: -
    func test_asParams_sucess() {
        // given
        sut = Expense(name: "Exam Fees", amount: 500, tag: nil)
        // then
        XCTAssertTrue(sut.asParameter.count == 3)
    }
}
