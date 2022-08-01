//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation
import UIKit


@objc(SDKObjectiveC)

public protocol SDKObjectiveC {
    func login()
}


extension SDKObjectiveC where Self:  UIView {
    
    init(frame: CGRect) {
        self.init(frame: frame)
    }
    init(frame: CGRect, editAccess: Int) {
        self.init(frame:frame)
    }
//    required init?(coder aDecoder: NSCoder) {
//        Self.init(coder: aDecoder)
//    }
    
    public func login() {
        if let topVC = UIApplication.topViewController() {
            let screenFrame = topVC.view.frame
            let windowWidth = screenFrame.width
            let windowHeight = screenFrame.height
            let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
            let newView = LoginView(frame: rect)
            newView.tag = 100
            topVC.view.addSubview(newView)
        }
        print("login")
    }
}
