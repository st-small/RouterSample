//
//  AppRouter.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import Combine
import SwiftUI

public enum AppRouterScreen {
    case login
    case tabs
}

public final class AppRouter: ObservableObject {
    
    @Published
    public var screen: AppRouterScreen = .login
    
    private var services: Services
    private var cancellables: Set<AnyCancellable> = []
    
    lazy private var loginRouter: LoginRouter = {
        LoginRouter(services: services)
    }()
    
    lazy private var tabRouter: TabRouter = {
        TabRouter(services: services)
    }()
    
    public init(services: Services) {
        self.services = services
        
        setBindings()
    }
    
    private func setBindings() {
        services.loginManager.state.$loggedIn
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                if value == true {
                    self?.screen = .tabs
                } else {
                    self?.screen = .login
                }
            }
            .store(in: &cancellables)
    }
    
    @ViewBuilder
    public func loginScreen() -> some View {
        LoginRouterView(router: LoginRouter(services: self.services))
    }
    
    @ViewBuilder
    public func tabScreen() -> some View {
        TabRouterView(router: TabRouter(services: self.services))
    }
}

public struct AppRouterView: View {
    @StateObject
    public var router: AppRouter
    
    public var body: some View {
        switch router.screen {
        case .login:
            router.loginScreen()
        case .tabs:
            router.tabScreen()
        }
    }
}
