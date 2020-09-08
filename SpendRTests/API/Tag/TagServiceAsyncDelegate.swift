//
//  TagServiceAsyncDelegate.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

import XCTest
@testable import SpendR

class TagServiceAsyncDelegate: TagServiceDelegate {

    // MARK: -
    var tagRequestServiceResult: Bool?
    var tagRequestServiceError: String?
    var asyncExpectation: XCTestExpectation?

    // MARK: -
    func didCompleteRequestWithSuccess(tags: [Tag]?) {
        asyncExpectation?.fulfill()
        tagRequestServiceResult = true
    }
    
    func didCompleteRequestWithFailure(error: String) {
        asyncExpectation?.fulfill()
        tagRequestServiceError = error
        tagRequestServiceResult = false
    }
}
