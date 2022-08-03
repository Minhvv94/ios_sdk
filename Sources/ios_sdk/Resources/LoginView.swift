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
    var userDefault = UserDefaults.standard
    
    
    @IBAction func btnClose(_ sender: Any) {
        //contentView.removeAllSubviews();
        print(self.tag)
        if (self.tag == 100) {
            self.removeFromSuperview()
        }
    }
    @IBAction func btnLogin(_ sender: Any) {
        
        print("user name : \(txtUserName.text)")
        print("password : \(txtPass.text)")
        
    }
    // bắt sự kiên bấm vào màn hình
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // ản bàn phím
        endEditing(true)
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
        
//        let deviceId = Utils.shared.getUUID()
//        let clentId = UserDefaults.standard.string(forKey: AppInfo.KEY_CLIENT_ID)  ?? ""
//        print("client id  : \(clentId)")
//
//        let client = AppInfo.shared.client_id
//        print("client   : \(client)")
        
        if(AppInfo.shared!= NULL && AppInfo.shared.packageId != NULL){
            String version = AppInfo.shared.version == NULL ? "1.0": AppInfo.shared.version;
            
            Repository().getGameCheckMaintain(request_app_package: AppInfo.shared.packageId, request_channel: AppInfo.shared.platformOS, request_version: AppInfo.shared.version, callBack: { (response) in
                if response.isSuccess() {
                    
                    print(\(response))
                }
            }
            
            
        }
        
        
    }
}
