//
//  ConcreteProduct.swift
//  DesignPatterns
//
//  Created by Minh Vu on 10/08/2022.
//

import Foundation
class ConcreteProduct1: Product {

    func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
}

class ConcreteProduct2: Product {

    func operation() -> String {
        return "{in ra cai  ConcreteProduct2}"
    }
}
