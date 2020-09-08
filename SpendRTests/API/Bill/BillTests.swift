//
//  BillTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class BillTests: XCTestCase {
    
    var sut: Bill!
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_asParams_nilTag() {
        // given
        sut = Bill(name: "", amount: 500, date: Date(), tag: nil)
        
        // then
        XCTAssertTrue(sut.asParameter.count == 3)
    }
}
