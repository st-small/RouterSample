//
//  LoginRouter.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public final class LoginRouter: ObservableObject {
    
    @Published
    public var showOnboarding: Bool = false
    
    lazy private var onboardingRouter: OnboardingRouter = {
        OnboardingRouter(services: services)
    }()
    
    private var services: Services
    
    init(services: Services) {
        self.services = services
        showOnboarding = !services.defaultsManager.getDefault(.hasPresentedOnboarding)
    }
    
    @ViewBuilder
    public func loginScreen() -> some View {
        LoginScreen(router: self, viewModel: LoginScreenViewModel(services: self.services))
    }
    
    @ViewBuilder
    public func onboardingScreen() -> some View {
        OnboardingRouterView(router: OnboardingRouter(services: self.services))
    }
}

public struct LoginRouterView: View {
    
    @StateObject
    public var router: LoginRouter
    
    public var body: some View {
        NavigationView {
            router.loginScreen()
                .sheet(isPresented: $router.showOnboarding) {
                    router.onboardingScreen()
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension LoginRouter: LoginScreenViewRouter { }
