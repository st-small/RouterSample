//
//  ProfileScreen.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public protocol ProfileScreenRouter: AnyObject { }

public struct ProfileScreen: View {
    
    @State
    public var router: ProfileScreenRouter?
    
    @StateObject
    public var viewModel: ProfileScreenViewModel
    
    public var body: some View {
        VStack {
            HStack {
                Text("Username: \(viewModel.userName)")
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

public final class ProfileScreenViewModel: BaseViewModel<Services>, ObservableObject {
    
    @Published
    public var userName: String = ""
    
    public override init(services: Services) {
        super.init(services: services)
        
        setup()
    }
    
    private func setup() {
        userName = services.loginManager.state.userName ?? "Unknown"
    }
}
