//
//  File.swift
//  
//
//  Created by Minh Vu on 04/08/2022.
//

import Foundation
@objc public protocol ObjectiveCBridgeable {
    public var isBridgedToObjectiveC: Bool { get }
}

public extension ObjectiveCBridgeable {
    public var isBridgedToObjectiveC: Bool { return true }

}
