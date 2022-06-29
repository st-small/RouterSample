//
//  OnboardingRouter.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import SwiftUI

public final class OnboardingRouter: ObservableObject {
    
    private var services: Services
    
    init(services: Services) {
        self.services = services
    }
    
    @ViewBuilder
    fileprivate func onboardingContent(text: String) -> some View {
        ZStack {
            Text(text)
        }
    }
    
    public func presentedOnboarding() {
        services.defaultsManager.setDefault(.hasPresentedOnboarding, value: true)
    }
}

public struct OnboardingRouterView: View {
    
    @Environment(\.presentationMode)
    var presentationMode
    
    @StateObject
    public var router: OnboardingRouter
    
    public var body: some View {
        TabView {
            router.onboardingContent(text: "Some content to help user")
            router.onboardingContent(text: "Second page")
            router.onboardingContent(text: "Third page")
            router.onboardingContent(text: "Fourth page")
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            setupPageControlColors()
            router.presentedOnboarding()
        }
    }
    
    private func setupPageControlColors() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
        UIPageControl.appearance().tintColor = .lightGray
    }
}
