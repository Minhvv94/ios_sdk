//
//  ConcreteProduct.swift
//  DesignPatterns
//
//  Created by Minh Vu on 10/08/2022.
//

import Foundation
open class ConcreteProduct1: Product {

    public func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
}

open class ConcreteProduct2: Product {

    public func operation() -> String {
        return "{in ra cai  ConcreteProduct2}"
    }
}
