//
//  File.swift
//  
//
//  Created by Minh Vu on 18/07/2022.
//

import Foundation

public struct SDK {
    
    static let shared = SDK();
    
    public private(set) var text = "Hello, World!"
    
    

    public init() {
    }
    
    func login(){
        print("Login  sdk")
    }
}

