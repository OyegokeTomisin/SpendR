//
//  TagServiceTests.swift
//  SpendRTests
//
//  Created by OYEGOKE TOMISIN on 08/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import XCTest
import FirebaseAuth
@testable import SpendR

class TagServiceTests: XCTestCase {

    // MARK: -
    var tag: Tag!
    var asyncDelegate: TagServiceAsyncDelegate!
    var sut: TagService!

    // MARK: - Setup
    override func setUp() {
        asyncDelegate = TagServiceAsyncDelegate()
        sut = TagService(delegate: asyncDelegate)
        tag = Tag(id: nil, name: "Entertainment")
    }

    override func tearDown() {
        tag = nil
        asyncDelegate = nil
        sut = nil
    }

    // MARK: - Conditions
    func userIsLoggedIn(completion: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: "tomisin18@gmail.com", password: "password", completion: completion)
    }

    func userIsLoggedOut(completion: @escaping ()->()) {
        userIsLoggedIn { _, _ in
            try! Auth.auth().signOut()
            completion()
        }
    }

    // MARK: - Create
    func test_createTag_loggedOutUser() {
        // given
        userIsLoggedOut {
            self.sut.create(tag: self.tag)
        }
        // then
        let exp = expectation(description: "User is not auhtenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.tagRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_createTag_loggedInUser() {
        // given
        userIsLoggedIn { _, _ in
            self.sut.create(tag: self.tag)
        }
        // then
        let exp = expectation(description: "Created tag successfully")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.tagRequestServiceResult == true)
        }
    }

    // MARK: - Fetch
    func test_fetchTag_loggedOutUser() {
        // given
        userIsLoggedOut {
            self.sut.fetchTags()
        }
        // then
        let exp = expectation(description: "User is not authenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.tagRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_fetchTag_loggedInUser() {
        // given
        userIsLoggedIn { _, _ in
            self.sut.fetchTags()
        }
        // then
        let exp = expectation(description: "Fetched tag successfully")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.tagRequestServiceResult == true)
        }
    }

    // MARK: - Delete
    func test_deleteTag_loggedOutUser() {
        // given
        let tagId = "123"
        userIsLoggedOut {
            self.sut.deleteTag(with: tagId)
        }
        // then
        let exp = expectation(description: "User is not authenticated")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.tagRequestServiceError == EndpointError.incompleteTask.localizedDescription)
        }
    }

    func test_deleteTag_loggedInUser() {
        // given
        let tagId = "123"
        userIsLoggedIn { _, _ in
            self.sut.deleteTag(with: tagId)
        }
        // then
        let exp = expectation(description: "Deleted tag with specified id")
        asyncDelegate.asyncExpectation = exp
        waitForExpectations(timeout: 100) { error in
            XCTAssert(self.asyncDelegate.tagRequestServiceResult == true)
        }
    }
}
