//
//  ConcreteCreator.swift
//  DesignPatterns
//
//  Created by Minh Vu on 10/08/2022.
//

import Foundation
class ConcreteCreator1: Creator {
    public func factoryMethod() -> Product {
        return ConcreteProduct1()
    }
}

class ConcreteCreator2:  Creator {
    public func factoryMethod() -> Product {
        return ConcreteProduct2()
    }
}
