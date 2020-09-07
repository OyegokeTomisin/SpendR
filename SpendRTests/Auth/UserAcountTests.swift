//
//  UserAcountTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 07/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class UserAcountTests: XCTestCase {

    var email: String!
    var password: String!

    override func setUp() {

    }

    override func tearDown() {
        email = nil
        password = nil
    }

    func invalidPassword() {
        email = "tomisin18@gmail.com"
        password = "pass"
    }

    func invalidEmail() {
        email = "tomisin@gmailcom"
        password = "pass"
    }

    func validEmailAndPasssword() {
        email = "tomisin@gmail.com"
        password = "password"
    }

    func test_userAccount_InvalidPassword() {
        // given
        invalidPassword()

        //then
        do {
            _ = try UserAccount(email: email, password: password)
        } catch let error {
            XCTAssertTrue(error.localizedDescription == UserAccountError.invalidPassword.localizedDescription)
        }
    }

    func test_userAccount_InvalidEmail() {
        // given
        invalidEmail()

        //then
        do {
            _ = try UserAccount(email: email, password: password)
        } catch let error {
            XCTAssertTrue(error.localizedDescription == UserAccountError.invalidEmail.localizedDescription)
        }
    }

    func test_userAccount_validEmailAndPassword() {
        // given
        validEmailAndPasssword()

        // then
        XCTAssertNoThrow(try UserAccount(email: email, password: password))
    }
}
