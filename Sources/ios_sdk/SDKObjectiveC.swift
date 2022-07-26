//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation
import UIKit

@objc(SDKObjectiveC)
public class SDKObjectiveC: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc init(frame: CGRect, editAccess: Int) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc open func  login() {
        if let topVC = UIApplication.topViewController() {
            
            let screenFrame = topVC.view.frame
            let windowWidth = screenFrame.width
            let windowHeight = screenFrame.height
             print("width : \(windowWidth) ")
            
            print("height : \(windowHeight) ")
            let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
            let newView = LoginView(frame: rect)
            newView.tag = 100
            topVC.view.addSubview(newView)
        }
        print("login")
    }
}
