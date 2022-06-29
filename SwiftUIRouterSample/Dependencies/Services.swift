//
//  Services.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import Foundation

public protocol Services {
    var defaultsManager: DefaultsManager { get }
    var loginManager: LoginManager { get }
}

public final class AppServices: Services {
    public var loginManager: LoginManager
    public var defaultsManager: DefaultsManager
    
    public init() {
        defaultsManager = AppDefaultsManager()
        loginManager = AppLoginManager(defaultsManager: defaultsManager)
    }
}

public final class MockServices: Services {
    public var defaultsManager: DefaultsManager = MockDefaultsManager()
    public var loginManager: LoginManager = MockLoginManager()
}
