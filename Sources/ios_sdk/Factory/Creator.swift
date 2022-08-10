//
//  Creator.swift
//  DesignPatterns
//
//  Created by Minh Vu on 10/08/2022.
//

import Foundation
public protocol Creator {
    func factoryMethod() -> Product
    func someOperation() -> String
}

extension Creator {

    public func someOperation() -> String {
        let product = factoryMethod()
        return "Creator: " + product.operation()
    }
}
