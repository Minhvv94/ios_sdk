//
//  LoginView.swift
//  
//
//  Created by Minh Vu on 20/07/2022.
//

import UIKit


@objc(LoginView)
class LoginView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    let topVC = UIApplication.topViewController();
    

    
    @IBAction func btnClose(_ sender: Any) {
        //contentView.removeAllSubviews();
        print(self.tag)
        if (self.tag == 100) {
            self.removeFromSuperview()
        }
    }
    @IBAction func btnLogin(_ sender: Any) {
        print("user name : \(txtUserName)")
        print("password : \(txtPass)")
        
    }
    
    
    let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
    self.addGestureRecognizer(gesture)

    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        
        print("click")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpView(){
        Bundle.module.loadNibNamed("LoginView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.bindToKeyboard()

    }
    

    
}
