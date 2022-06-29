//
//  ViewModel.swift
//  SwiftUIRouterSample
//
//  Created by Stanly Shiyanovskiy on 28.06.2022.
//

import Foundation

public class BaseViewModel<S> {
    
    public var services: S
    
    public init(services: S) {
        self.services = services
    }
}
