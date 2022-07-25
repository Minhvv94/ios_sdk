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
    
    @objc open func  getSDK() {
        if let topVC = UIApplication.topViewController() {
            let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
            let newView = LoginView(frame: rect)
            newView.backgroundColor = UIColor.black
            topVC.view.addSubview(newView)
        }
        print("getSDK")
    }
   
    @objc open func login(){
        print("login")
    }
}
