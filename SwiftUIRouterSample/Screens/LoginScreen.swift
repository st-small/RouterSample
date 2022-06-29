//
//  LoginScreen.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public protocol LoginScreenViewRouter: AnyObject { }

public struct LoginScreen: View {
    @State
    public var router: LoginScreenViewRouter?
    @StateObject
    public var viewModel: LoginScreenViewModel
    
    public var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Button {
                    viewModel.logIn()
                } label: {
                    Text("Login")
                }
                .disabled(viewModel.loggingIn)
            }
            
            if viewModel.loggingIn {
                ProgressView()
            }
        }
        .padding()
        .navigationTitle("Login somewhere")
    }
}

public final class LoginScreenViewModel: BaseViewModel<Services>, ObservableObject {
    
    @Published
    public var loggingIn: Bool = false
    
    override init(services: Services) {
        super.init(services: services)
    }
    
    public func logIn() {
        services.loginManager.logIn()
        loggingIn = true
    }
}
