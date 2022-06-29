//
//  AccountScreen.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public protocol AccountScreenRouter: AnyObject {
    func accountScreenProfileScreen() -> ProfileScreen
}

public struct AccountScreen: View {
    
    @State
    public var router: AccountScreenRouter
    
    @StateObject
    public var viewModel: AccountScreenViewModel
    
    public var body: some View {
        VStack {
            List {
                NavigationLink {
                    router.accountScreenProfileScreen()
                } label: {
                    Text("User profile")
                }
            }
            .listStyle(PlainListStyle())
            
            Button {
                viewModel.logout()
            } label: {
                Text("Log out")
            }
        }
        .padding()
    }
}

public final class AccountScreenViewModel: BaseViewModel<Services>, ObservableObject {
    
    public override init(services: Services) {
        super.init(services: services)
    }
    
    public func logout() {
        services.loginManager.logOut()
    }
}
