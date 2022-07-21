//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation

@objc class SDKObjectiveC : NSObject {
    
    var someProperty: String = "Some Initializer Val"

    public override init() {}

    func someFunction(someArg:AnyObject) -> String {
        var returnVal = "You sent me \(someArg)"
        return returnVal
    }
}
