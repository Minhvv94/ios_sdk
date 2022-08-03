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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc init(frame: CGRect, editAccess: Int) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc open func  login() {
        if let topVC = UIApplication.topViewController() {
            
//            let screenFrame = topVC.view.frame
//            let windowWidth = screenFrame.width
//            let windowHeight = screenFrame.height
//            let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
//            let newView = LoginView(frame: rect)
//            newView.tag = 100
//            topVC.view.addSubview(newView)
            
            
            
            if(AppInfo.shared != nil && AppInfo.shared.packageId != nil){
                let version = AppInfo.shared.version == "" ? "1.0": AppInfo.shared.version;
                
                Repository().getGameCheckMaintain(request_app_package: AppInfo.shared.packageId, request_channel: AppInfo.shared.platformOS, request_version: AppInfo.shared.version, callBack: { (response) in
                    if response.isSuccess(){
                        let data = JsonParserManager.getMaitainCheckerJson(jsonString: response.rawData ?? "")
                        if (data?.data?.isMaintained)! {
                            let alert = UIAlertController(title: "Thông báo", message: data?.data?.messageMaintain, preferredStyle: UIAlertController.Style.alert)

                                    // add an action (button)
                                    alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertAction.Style.default, handler: nil))

                                    // show the alert
                            topVC.present(alert, animated: true, completion: nil)
                        }
                    }
                })
            }
        }
        print("login")
    }
}
