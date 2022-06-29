//
//  HomeScreen.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public protocol HomeScreenRouter: AnyObject { }

public struct HomeScreen: View {
    
    @State
    public var router: HomeScreenRouter?
    
    @StateObject
    public var viewModel: HomeScreenViewModel
    
    public var body: some View {
        Text("Home")
    }
}

public final class HomeScreenViewModel: BaseViewModel<Services>, ObservableObject {
    
    public override init(services: Services) {
        super.init(services: services)
    }
}
