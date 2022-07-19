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
        topView.view.backgroundColor = UIColor.blue
        
        
        
        
        let loginView = LoginView.fromNib(named: "LoginView")
        loginView.translatesAutoresizingMaskIntoConstraints = false;
//
//        topView.view.addSubview(loginView)
//
//                NSLayoutConstraint.activate([
//                    loginView.leadingAnchor.constraint(equalTo: topView.view.leadingAnchor, constant: 10),
//                    loginView.trailingAnchor.constraint(equalTo: topView.view.trailingAnchor, constant: -10),
//                    loginView.topAnchor.constraint(equalTo: topView.view.topAnchor, constant: 200),
//                    loginView.heightAnchor.constraint(equalToConstant: 500)
//                ])
        
    }
}

