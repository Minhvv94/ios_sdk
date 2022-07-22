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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc open func  getSDK() {
        print(" ios sdk getSDK")
    }
   
    @objc open func login(topView : UIViewController){
        
        print("login")
        topView.view.backgroundColor = UIColor.red
    }
}
