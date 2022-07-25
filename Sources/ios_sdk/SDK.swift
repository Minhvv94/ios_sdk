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
            let rect = CGRect(x: 0, y: 0, width: 480, height: 800)
            let newView = LoginView(frame: rect)
            newView.backgroundColor = UIColor.blue
            topVC.view.addSubview(newView)
        }
        
        
//        let rect = CGRect(x: 0, y: 0, width: 480, height: 800)
//        let newView = LoginView(frame: rect)
//        newView.backgroundColor = UIColor.blue
//        topView.view.addSubview(newView)
        
//        let loginView = LoginView.fromNib(named: "LoginView");
//        loginView.translatesAutoresizingMaskIntoConstraints = false;
//        loginView.backgroundColor = UIColor.blue
//        topView.view.addSubview(loginView);
//                NSLayoutConstraint.activate([
//                    loginView.leadingAnchor.constraint(equalTo: topView.view.leadingAnchor, constant: 10),
//                    loginView.trailingAnchor.constraint(equalTo: topView.view.trailingAnchor, constant: -10),
//                    loginView.topAnchor.constraint(equalTo: topView.view.topAnchor, constant: 20),
//                    loginView.heightAnchor.constraint(equalToConstant: 50)
//                ])
        
    }
}

