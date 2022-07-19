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
    
        print("login")
        let topView = UIApplication.topViewController();
        topView?.view.backgroundColor = UIColor.blue
        
        
        print(topView?.view.leadingAnchor)
        
        
//        let loginView = LoginView.fromNib(named: "LoginView")
//        loginView.translatesAutoresizingMaskIntoConstraints = false;
//
//        loginView.frame = CGRect(x:0, y: 0, width: 100, height: 50.0)
        
        print("set background")

//        topView?.view.addSubview(loginView)
//                NSLayoutConstraint.activate([
//                    loginView.leadingAnchor.constraint(equalTo: (topView?.view.leadingAnchor)!, constant: 10),
//                    loginView.trailingAnchor.constraint(equalTo: (topView?.view.trailingAnchor)!, constant: -10),
//                    loginView.topAnchor.constraint(equalTo: (topView?.view.topAnchor)!, constant: 50),
//                    loginView.heightAnchor.constraint(equalToConstant: 50)
//                ])
        
    }
}

