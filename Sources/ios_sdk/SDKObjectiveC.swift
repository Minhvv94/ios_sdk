//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation
import UIKit
protocol IosSdk {
    func login()
    func dashBoard()
    func listProduct()
}





@objc(SDKObjectiveC)
public class SDKObjectiveC: UIView, IosSdk {

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
                                        newView.tag = 100
                                        topVC.view.addSubview(newView)
                        }
                    }else{
                        
                    }
                })
                
                
            }
        }
        print("login")
    }
    
    
    @objc open func dashBoard(){
        if let topVC = UIApplication.topViewController() {
            let screenFrame = topVC.view.frame
            let windowWidth = screenFrame.width
            let windowHeight = screenFrame.height
            
            print("windowWidth \(windowWidth)")
            print("windowHeight \(windowHeight)")
            if (self.tag == 101) {
                self.removeFromSuperview()
            }
            buttonView.tag = 101
            topVC.view.addSubview(buttonView)
            
            buttonView.frame = CGRect(x: 0, y: 100, width: 50, height: 50)
            buttonView.tapBlock = {
                if (self.buttonView.tag == 101) {
                    self.buttonView.removeFromSuperview()
                }
                let rect = CGRect(x: 0, y: 0, width: windowWidth * 0.75, height: windowHeight)
                let dashboardView = DashboardView(frame: rect)
                dashboardView.tag = 102
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
        
    }

}

