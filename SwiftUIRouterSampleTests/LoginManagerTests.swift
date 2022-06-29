//
//  LoginManagerTests.swift
//  SwiftUIRouterSampleTests
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import XCTest
@testable import SwiftUIRouterSample

final class LoginManagerTests: XCTestCase {
    
    var service: MockLoginManager!
    
    override func setUp() {
        super.setUp()
        service = MockLoginManager()
    }

    func test_LogIn() {
        service.logIn()
        XCTAssertTrue(service.didLogin)
    }
    
    func test_LogOut() {
        service.logOut()
        XCTAssertTrue(service.didLogout)
    }
}
