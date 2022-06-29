//
//  DefaultsManager.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import Foundation

public enum UserDefaultsKey: String {
    static let keyPrefix = "com.swisscows.teleguard.UserDefaults"
    
    case loggedIn
    case userName
    case hasPresentedOnboarding
    
    func defaultKey() -> String {
        UserDefaultsKey.keyPrefix + "." + rawValue
    }
}

public protocol DefaultsManager {
    func getDefault(_ key: UserDefaultsKey) -> Bool
    func setDefault(_ key: UserDefaultsKey, value: Bool)
    
    func getDefault(_ key: UserDefaultsKey) -> String?
    func setDefault(_ key: UserDefaultsKey, value: String)
}

public final class AppDefaultsManager: DefaultsManager {
    public func getDefault(_ key: UserDefaultsKey) -> Bool {
        UserDefaults.standard.bool(forKey: key.defaultKey())
    }
    
    public func setDefault(_ key: UserDefaultsKey, value: Bool) {
        UserDefaults.standard.set(value, forKey: key.defaultKey())
    }
    
    public func getDefault(_ key: UserDefaultsKey) -> String? {
        UserDefaults.standard.string(forKey: key.defaultKey())
    }
    
    public func setDefault(_ key: UserDefaultsKey, value: String) {
        UserDefaults.standard.set(value, forKey: key.defaultKey())
    }
}

public final class MockDefaultsManager: DefaultsManager {
    public var didGetDefaultBool = false
    public var didSetDefaultBool = false
    public var didGetDefaultString = false
    public var didSetDefaultString = false
    
    public func getDefault(_ key: UserDefaultsKey) -> Bool {
        didGetDefaultBool = true
        return false
    }
    
    public func setDefault(_ key: UserDefaultsKey, value: Bool) {
        didSetDefaultBool = true
    }
    
    public func getDefault(_ key: UserDefaultsKey) -> String? {
        didGetDefaultString = true
        return nil
    }
    
    public func setDefault(_ key: UserDefaultsKey, value: String) {
        didSetDefaultString = true
    }
}
