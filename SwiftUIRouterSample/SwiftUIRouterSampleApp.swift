//
//  SwiftUIRouterSampleApp.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

@main
struct SwiftUIRouterSampleApp: App {
    var body: some Scene {
        WindowGroup {
            AppRouterView(router: AppRouter(services: AppServices()))
        }
    }
}
