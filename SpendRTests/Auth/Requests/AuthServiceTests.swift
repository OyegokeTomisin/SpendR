//
//  AuthServiceTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 07/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class AuthServiceTests: XCTestCase {

    // MARK: -
    var userAccount: UserAccount!
    var asyncDelegate: AuthServiceAsyncDelegate!
    var service: AuthService!

    // MARK: -
    override func setUp() {
        asyncDelegate = AuthServiceAsyncDelegate()
        service = AuthService(delegate: asyncDelegate)
    }

    override func tearDown() {
        userAccount = nil
        asyncDelegate = nil
        service = nil
    }

    // MARK: -
    func invalidUserLogin() {
        userAccount = try! UserAccount(email: "tomisin19@gmail.com", password: "fakepassword")
    }

    func validUserLogin() {
        userAccount = try! UserAccount(email: "tomisin18@gmail.com", password: "password")
    }

    func validUserCreateAccount() {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMddHHMMSS"
        let timeStamp = formatter.string(from: Date())
        userAccount = try! UserAccount(email: "tomisin\(timeStamp)@gmail.com", password: "password")
    }

    func test_createAccount_withExistingEmail() {
        // given
        validUserLogin()

        // when
        service.createUser(with: userAccount)

        // then
        let exp = expectation(description: "The email address is already in use by another account")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 30) { error in
            XCTAssert(self.asyncDelegate.authRequestServiceResult == false)
        }
    }

    func test_createAccount_withNonExistingEmail() {
        // given
        validUserCreateAccount()

        //when
        service.createUser(with: userAccount)

        // then
        let exp = expectation(description: "Account successfully created")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 30) { error in
            XCTAssert(self.asyncDelegate.authRequestServiceResult == true)
        }
    }

    func test_userLogin_incorrectLoginDetail() {
        // given
        invalidUserLogin()

        // when
        service.loginUser(with: userAccount)

        // then
        let exp = expectation(description: "There is no user record corresponding to this identifier")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 30) { error in
            XCTAssert(self.asyncDelegate.authRequestServiceResult == false)
        }
    }
    
    func test_userLogin_correctLoginDetail() {
        // given
        validUserLogin()

        // when
        service.loginUser(with: userAccount)

        // then
        let exp = expectation(description: "Login successful")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 30) { error in
            XCTAssert(self.asyncDelegate.authRequestServiceResult == true)
        }
    }

    func test_userLogout(){
        service.logutUserAccount { result in

        }
    }
}
