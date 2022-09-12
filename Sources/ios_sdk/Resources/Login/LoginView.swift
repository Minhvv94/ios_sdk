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
    
    @IBAction func btnClose(_ sender: Any) {
        //contentView.removeAllSubviews();
        if (self.tag == 100) {
            self.removeFromSuperview()
        }
    }
    // bắt sự kiên bấm vào màn hình
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // ản bàn phím
        endEditing(true)
        self.deregisterFromKeyboardNotifications()
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
        // bấm vào view
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(checkAction))
        addGestureRecognizer(gesture)
        
        // dang ky hien thi ban phim
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
    @IBAction func btnPlayNow(_ sender: Any)  {
        TimeServerRepository().getServerTime { response in
            let jdt =  JDT(dvId:  Utils.shared.getDeviceId(), os: AppInfo.shared.platformOS)
            let body = Utils.shared.createJwtFromJdt(jdt: jdt, time: Int(response.rawData!) ?? 0)
            
            Repository().loginFast(jwt: body) { (response) in
                if response.isSuccess() {
                    let data = JsonParserManager.getUserLogin(jsonString: response.rawData ?? "")
                    UserManager.shared.setToken(token: data?.data?.access_token ?? "")
                    UserManager.shared.setRefreshToken(refreshToken: data?.data?.refresh_token ?? "")
                    
                    let payload = Utils.shared.getPayloadInToken(jwtToken: data?.data?.access_token ?? "")
                    
                    
                    if let topVC = UIApplication.topViewController() {
                        
                        let welcomeView = WelcomeView()
                        topVC.view.addSubview(welcomeView)
                        welcomeView.translatesAutoresizingMaskIntoConstraints = false
                        
                        NSLayoutConstraint.activate([
                            welcomeView.topAnchor.constraint(equalTo: topVC.view.topAnchor, constant: 20),
                            welcomeView.leadingAnchor.constraint(equalTo: topVC.view.leadingAnchor, constant: 20),
                            welcomeView.widthAnchor.constraint(equalTo: topVC.view.widthAnchor, constant: topVC.view.widthAnchor/2 + 40),
                            welcomeView.heightAnchor.constraint(equalToConstant: 60)
                        ])
                        
                        
                        welcomeView.sayHi(accountName: "Minh Vu")
                        welcomeView.tag = 107
                        
                    }

                    if (self.tag == 100) {
                        self.removeFromSuperview()
                    }
                    
                }
            }
        }
    }
    
    // start ===========sự kiện ẩn hiện bản phím
    func registerForKeyboardNotifications ()-> Void   {
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWasShown),
            name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillBeHidden),
            name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    func deregisterFromKeyboardNotifications () -> Void {
        let center:  NotificationCenter = NotificationCenter.default
        center.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        UIView.animate(withDuration: 0.25, delay: 0.25, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.layoutBottomContainer.constant = 0
        }, completion: nil)
    }
    @objc func keyboardWasShown () {
        UIView.animate(withDuration: 0.25, delay: 0.25, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.layoutBottomContainer.constant = -50
        }, completion: nil)
    }

    @objc func keyboardWillBeHidden () {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.layoutBottomContainer.constant = 0
        }, completion: nil)
    }
    // stop ===========sự kiện ẩn hiện bản phím
}
