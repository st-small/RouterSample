//
//  DefaultManagerTests.swift
//  SwiftUIRouterSampleTests
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import XCTest
@testable import SwiftUIRouterSample

final class DefaultManagerTests: XCTestCase {
    
    var service: MockDefaultsManager!
    
    override func setUp() {
        super.setUp()
        service = MockDefaultsManager()
    }

    func test_BoolStorageSet() {
        service.setDefault(.loggedIn, value: true)
        XCTAssertTrue(service.didSetDefaultBool)
    }
    
    func test_BoolStorageGet() {
        service.setDefault(.loggedIn, value: true)
        let _: Bool = service.getDefault(.loggedIn)
        XCTAssertTrue(service.didGetDefaultBool)
    }
    
    func test_StringStorageSet() {
        service.setDefault(.userName, value: "AnyValue")
        XCTAssertTrue(service.didSetDefaultString)
    }
    
    func test_StringStorageGet() {
        service.setDefault(.userName, value: "Any")
        let _: String? = service.getDefault(.userName)
        XCTAssertTrue(service.didGetDefaultString)
    }
}
