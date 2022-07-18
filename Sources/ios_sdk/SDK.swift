//
//  File.swift
//  
//
//  Created by Minh Vu on 18/07/2022.
//

import Foundation

public struct SDK {
    
    public static let shared = SDK();
    
    public private(set) var text = "Hello, World!"
    
    
    public init() {
    }
    
    public func login(){
    
        let topView = UIApplication.topViewController();
        topView.backgroundColor = UIColor.red
    }
}

