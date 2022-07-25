//
//  LoginView.swift
//  
//
//  Created by Minh Vu on 20/07/2022.
//

import UIKit


@objc(LoginView)
class LoginView: UIView {

    @IBOutlet weak var contentView: UIView!
    //@IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
//    @objc init(frame: CGRect, editAccess: Int) {
//        super.init(frame:frame)
//        setUpView()
//    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView(){
        Bundle.module.loadNibNamed("LoginView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
}
