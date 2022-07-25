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
        if let topVC = UIApplication.topViewController() {
            let screenFrame = topVC.view.frame
            let windowWidth = screenFrame.width
            let windowHeight = screenFrame.height
            let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
            let newView = LoginView(frame: rect)
            newView.backgroundColor = UIColor.gray
            topVC.view.addSubview(newView)
        }
        
    }
}

