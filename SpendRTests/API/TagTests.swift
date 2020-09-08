//
//  TagTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 07/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
@testable import SpendR

class TagTests: XCTestCase {

    var sut: Tag!

    override func setUp() {

    }

    override func tearDown() {
        sut = nil
    }

    func test_asParams_sucess() {
        // given
        sut = Tag(id: nil, name: "")

        // and
        let expectation = sut.asParameter[ParamConstant.name.key] as! String

        // then
        XCTAssertTrue(expectation == "")
    }

    func test_asParams_withTagId() {
        // given
        sut = Tag(id: "123456", name: "")

        // and
        let expectation = sut.asParameter["id"] as? String

        // then
        XCTAssertTrue(expectation == nil)
    }
}
