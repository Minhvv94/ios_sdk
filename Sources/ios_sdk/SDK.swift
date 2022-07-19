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
    
        var topView = UIApplication.topViewController();

        let v = UIView(frame: topView.bounds)
        topView.addSubview(v)
        v.backgroundColor = UIColor.blackColor()
        
    }
}

