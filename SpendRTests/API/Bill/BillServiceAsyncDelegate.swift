//
//  BillServiceAsyncDelegate.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class BillServiceAsyncDelegate: BillServiceDelegate {

    // MARK: -
    var billRequestServiceResult: Bool?
    var billRequestServiceError: String?
    var asyncExpectation: XCTestExpectation?

    // MARK: -
    func didCompleteRequestWithSuccess(bills: [Bill]?) {
        asyncExpectation?.fulfill()
        billRequestServiceResult = true
    }

    func didCompleteRequestWithFailure(error: String) {
        asyncExpectation?.fulfill()
        billRequestServiceError = error
        billRequestServiceResult = false
    }
}
