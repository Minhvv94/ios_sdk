//
//  LoginView.swift
//  
//
//  Created by Minh Vu on 20/07/2022.
//

import UIKit


@objc(LoginView)
class LoginView: UIView {

    @IBOutlet weak var layoutBottomContainer: NSLayoutConstraint!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    var userDefault = UserDefaults.standard
    var offset = 0
    
    @IBAction func btnClose(_ sender: Any) {
        //contentView.removeAllSubviews();
        if (self.tag == 100) {
            self.removeFromSuperview()
        }
    }
    // bắt sự kiên bấm vào màn hình
//    @objc func checkAction(sender : UITapGestureRecognizer) {
//        // ản bàn phím
//        endEditing(true)
//
//        self.keyboardWillShow()
//        endEditing(false)
//    }
    
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
        
        offset = 0
    
        // bấm vào view
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(checkAction))
//        addGestureRecognizer(gesture)
        
        self.registerForKeyboardNotifications()
    }
    

    @IBAction func btnForget(_ sender: Any) {
    }
    @IBAction func btnRegister(_ sender: Any) {
    }
    @IBAction func btnFacebook(_ sender: Any) {
    }
    @IBAction func btnGoogle(_ sender: Any) {
    }
    @IBAction func btnPlayNow(_ sender: Any) {
        // get device ID
    }
    
    
//    func keyboardWillShow() {
//        UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
//            self.layoutIfNeeded()
//            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations:{
//                self.layoutBottomContainer.constant -= 50
//            })
//        })
//    }
    
    
    // sự kiện ẩn hiện bản phím
    func registerForKeyboardNotifications ()-> Void   {
        NotificationCenter.default.addObserver(self, selector: Selector("keyboardWasShown"), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector("keyboardWillBeHidden"), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func deregisterFromKeyboardNotifications () -> Void {
        let center:  NotificationCenter = NotificationCenter.default
        center.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func keyboardWasShown (notification: NSNotification) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.layoutBottomContainer.constant = 50
        }, completion: nil)

    }

    func keyboardWillBeHidden (notification: NSNotification) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.layoutBottomContainer.constant = 0
        }, completion: nil)
    }
}
