//
//  File.swift
//  
//
//  Created by Minh Vu on 02/08/2022.
//

import Foundation
import UIKit

public class SdkIplement: UIView, ISdk {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc init(frame: CGRect, editAccess: Int) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func loginTest() {
        print("login")
    }
}
