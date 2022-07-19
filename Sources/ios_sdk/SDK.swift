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
        topView.view.backgroundColor = UIColor.red
        
        
        
        
        let loginView = TestView.fromNib(named: "TestView")

        topView.view.addSubview(loginView)

                NSLayoutConstraint.activate([
                    loginView.leadingAnchor.constraint(equalTo: topView.view.leadingAnchor, constant: 10),
                    loginView.trailingAnchor.constraint(equalTo: topView.view.trailingAnchor, constant: -10),
                    loginView.topAnchor.constraint(equalTo: topView.view.topAnchor, constant: 20),
                    loginView.heightAnchor.constraint(equalToConstant: 50)
                ])
        
    }
}

