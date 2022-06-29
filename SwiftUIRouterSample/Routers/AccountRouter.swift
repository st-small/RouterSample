//
//  AccountRouter.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public final class AccountRouter: ObservableObject {
    
    private var services: Services
    
    public init(services: Services) {
        self.services = services
    }
    
    @ViewBuilder
    public func accountView() -> some View {
        AccountScreen(router: self, viewModel: AccountScreenViewModel(services: self.services))
    }
}

public struct AccountRouterView: View {
    
    public var router: AccountRouter
    
    public var body: some View {
        NavigationView {
            router.accountView()
                .navigationTitle("Account")
        }
        .navigationViewStyle(.stack)
    }
}

extension AccountRouter: AccountScreenRouter {
    public func accountScreenProfileScreen() -> ProfileScreen {
        ProfileScreen(router: self, viewModel: ProfileScreenViewModel(services: self.services))
    }
}

extension AccountRouter: ProfileScreenRouter { }
