//
//  TabRouter.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public final class TabRouter: ObservableObject {
    
    private var services: Services
    
    init(services: Services) {
        self.services = services
    }
    
    @ViewBuilder
    public func home() -> some View {
        HomeScreen(router: self, viewModel: HomeScreenViewModel(services: self.services))
    }
    
    @ViewBuilder
    public func onboarding() -> some View {
        OnboardingRouterView(router: OnboardingRouter(services: self.services))
    }
    
    @ViewBuilder
    public func account() -> some View {
        AccountRouterView(router: AccountRouter(services: self.services))
    }
}

struct TabRouterView: View {
    
    @StateObject
    var router: TabRouter
    
    var body: some View {
        TabView {
            router.home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            router.onboarding()
                .tabItem {
                    Label("Onboarding", systemImage: "questionmark.circle.fill")
                }
            router.account()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
        }
    }
}

extension TabRouter: HomeScreenRouter { }
