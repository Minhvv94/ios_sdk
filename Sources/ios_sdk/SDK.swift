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
    
    public func login(topView : UIViewController ){
     
        print("login")
        //let topView = UIApplication.topViewController();
        topView.view.backgroundColor = UIColor.blue
        
        
        print(topView.view.leadingAnchor)
        
        
        let loginView = LoginView.fromNib(named: "LoginView")
        loginView.translatesAutoresizingMaskIntoConstraints = false;

        topView.view.addSubview(loginView)
        
        loginView.center = CGPoint(x: topView.view.frame.size.width,
                                   y: topView.view.frame.size.height)
        
    }
}

