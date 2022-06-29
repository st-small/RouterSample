//
//  LoginManager.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import Foundation

public protocol LoginManager {
    var state: LoginState { get }
    func logIn()
    func logOut()
}

public final class LoginState: ObservableObject {
    @Published
    public var loggedIn: Bool = false
    
    @Published
    public var userName: String?
}

public final class AppLoginManager: LoginManager {
    
    public var state: LoginState = LoginState()
    
    private var defaultsManager: DefaultsManager
    
    init(defaultsManager: DefaultsManager) {
        self.defaultsManager = defaultsManager
        
        setupValues()
    }
    
    private func setupValues() {
        state.loggedIn = defaultsManager.getDefault(.loggedIn)
        state.userName = defaultsManager.getDefault(.userName)
    }
    
    public func logIn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state.loggedIn = true
            self.state.userName = "Ivan"
            
            self.defaultsManager.setDefault(.loggedIn, value: true)
            self.defaultsManager.setDefault(.userName, value: "Ivan")
        }
    }
    
    public func logOut() {
        state.loggedIn = false
        state.userName = nil
        
        defaultsManager.setDefault(.loggedIn, value: false)
    }
}

public final class MockLoginManager: LoginManager {
    
    public var state: LoginState = LoginState()
    
    public var didLogin = false
    public var didLogout = false
    
    public func logIn() {
        didLogin = true
    }
    
    public func logOut() {
        didLogout = true
    }
}
