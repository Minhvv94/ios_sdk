//
//  File.swift
//  
//
//  Created by Minh Vu on 18/07/2022.
//

import Foundation
import UIKit

public struct SDK {
    
    public static let shared = SDK();
    
    public init() {
    }
    
    public func login(){
    
        let topView = UIApplication.topViewController();
        topView.backgroundColor = UIColor.red
    }
}

