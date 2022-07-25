//
//  LoginView.swift
//  
//
//  Created by Minh Vu on 20/07/2022.
//

import UIKit


@objc(LoginView)
class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc init(frame: CGRect, editAccess: Int) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
