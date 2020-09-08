//
//  AuthServiceAsyncDelegate.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 07/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class AuthServiceAsyncDelegate: AuthRequestServiceDelegate {

    var authRequestServiceResult: Bool?
    var asyncExpectation: XCTestExpectation?

    func didCompleteRequestWithSuccess() {
        asyncExpectation?.fulfill()
        authRequestServiceResult = true
    }

    func didCompleteRequestWithfailure(error: Error) {
        asyncExpectation?.fulfill()
        authRequestServiceResult = false
    }
}
