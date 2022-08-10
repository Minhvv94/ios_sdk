//
//  ConcreteCreator.swift
//  DesignPatterns
//
//  Created by Minh Vu on 10/08/2022.
//

import Foundation
open class ConcreteCreator1: Creator {
    public func factoryMethod() -> Product {
        return ConcreteProduct1()
    }
}

open  class ConcreteCreator2:  Creator {
    public func factoryMethod() -> Product {
        return ConcreteProduct2()
    }
}
