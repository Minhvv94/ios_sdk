//
//  Creator.swift
//  DesignPatterns
//
//  Created by Minh Vu on 10/08/2022.
//

import Foundation
protocol Creator {
    func factoryMethod() -> Product
    func someOperation() -> String
}

extension Creator {

   func someOperation() -> String {
        let product = factoryMethod()
        return "Creator: " + product.operation()
    }
}
