//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseMessaging
import UserNotifications


protocol IosSdk {
    func login()
    func dashBoard()
    func listProduct()
    func initWithDelegate(application: UIApplication, appInfo: AppInfo)
    
    func testXib()
}
@objc(SDKObjectiveC)
public class SDKObjectiveC: UIView, IosSdk, UIApplicationDelegate,  UNUserNotificationCenterDelegate, MessagingDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc init(frame: CGRect, editAccess: Int) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private let buttonView: FloatingButtonView = {
        let button = FloatingButtonView()
        let imageName = "BtnDashboard.png"
        let image = UIImage(named: imageName, in: Bundle.module, compatibleWith: nil)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.addSubview(imageView)
        return button
    }()
    
    @objc open func login() {
        if let topVC = UIApplication.topViewController() {
            if(AppInfo.shared.packageId != ""){
                let version = AppInfo.shared.version == "" ? "1.0": AppInfo.shared.version;
                Repository().getGameCheckMaintain(request_app_package: AppInfo.shared.packageId, request_channel: AppInfo.shared.platformOS, request_version: version, callBack: { (response) in
                    if response.isSuccess(){
                        let data = JsonParserManager.getMaitainCheckerJson(jsonString: response.rawData ?? "")
                        if (data?.data?.isMaintained)! {
                            let message = data?.data?.messageMaintain ?? ""
                            let alert = CustomeAlert.shared.showAlertOneButtonTapped(title: "Thông báo", message: message, btnTitle: "Đồng ý")
                             // show the alert
                            topVC.present(alert, animated: true, completion: nil)
                        }else{
                                        let screenFrame = topVC.view.frame
                                        let windowWidth = screenFrame.width
                                        let windowHeight = screenFrame.height
                                        let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
                                        let newView = LoginView(frame: rect)
                                        newView.tag = TagConst.TAG_LOGIN_VIEW
                                        topVC.view.addSubview(newView)
                        }
                    }else{
                        
                    }
                })
                
                
            }
        }
    }
    
    
    @objc open func dashBoard(){
        if let topVC = UIApplication.topViewController() {
            let screenFrame = topVC.view.frame
            let windowWidth = screenFrame.width
            let windowHeight = screenFrame.height
            if (self.tag == TagConst.TAG_BUTTON_VIEW) {
                self.removeFromSuperview()
            }
            buttonView.tag = TagConst.TAG_BUTTON_VIEW
            topVC.view.addSubview(buttonView)
            
            buttonView.frame = CGRect(x: 0, y: 100, width: 50, height: 50)
            buttonView.tapBlock = {
                if (self.buttonView.tag == TagConst.TAG_BUTTON_VIEW) {
                    self.buttonView.removeFromSuperview()
                }
                let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
                let dashboardView = DashboardView(frame: rect)
                dashboardView.tag = TagConst.TAG_DASHBOARD_VIEW
                topVC.view.addSubview(dashboardView)
            }

        }
        
    }
    
    private func showAlert(_ title: String) {
        if let topVC = UIApplication.topViewController() {
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            topVC.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc open func listProduct() {
        let proto1 :OptionalMethodsProtocol = OptionalMethodsProtocolExten()
        proto1.didDismiss();
        let proto2 :OptionalMethodsProtocol = OptionalMethodsProtocolExten2()
        proto2.didDismiss();
    }
    
    
    @objc open func initWithDelegate(application: UIApplication, appInfo: AppInfo){
        let filePath = Bundle.main.path(forResource: appInfo.firebaseConfigFile, ofType: "plist")
        guard let fileopts = FirebaseOptions.init(contentsOfFile: filePath!)
              else { assert(false, "Couldn't load config file") }
        FirebaseApp.configure(options: fileopts)
        
        Messaging.messaging().delegate = self //Nhận các message từ FirebaseMessaging
        configApplePush(application) // đăng ký nhận push.

    }
    
    func configApplePush(_ application: UIApplication) {
            if #available(iOS 10.0, *) {
                // For iOS 10 display notification (sent via APNS)
                UNUserNotificationCenter.current().delegate = self
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: {_, _ in })
            } else {
                let settings: UIUserNotificationSettings =
                    UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
            }
            
            application.registerForRemoteNotifications()
            
            if let token = Messaging.messaging().fcmToken {
                print("FCM token: \(token)")
            }
        }
    
    
    @objc open func testXib (){
        if let topVC = UIApplication.topViewController() {
            let screenFrame = topVC.view.frame
            let windowWidth = screenFrame.width
            let windowHeight = screenFrame.height
            let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
            let newView = ViewTest(frame: rect)
            newView.tag = TagConst.TAG_VIEW_TEST
            topVC.view.addSubview(newView)
        }
    }
}

