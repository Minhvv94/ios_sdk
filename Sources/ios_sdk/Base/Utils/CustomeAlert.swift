//
//  CustomeAlert.swift
//  
//
//  Created by Minh Vu on 03/08/2022.
//

import Foundation
import UIKit


class CustomeAlert {
    
    public static let shared = CustomeAlert()
    
    func showAlertOneButtonTapped(title: String ,message : String, btnTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: nil))
        
        return alert;
    }
    
    func showAlertTwoButtonTapped(title: String ,message : String, btnTitle1: String, btnTitle2: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: btnTitle1, style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: btnTitle2, style: UIAlertAction.Style.cancel, handler: nil))
        
        return alert;
    }
    func showAlertThreeButtonTapped(title: String ,message : String, btnTitle1: String, btnTitle2: String, btnTitle3: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: btnTitle1, style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: btnTitle2, style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: btnTitle3, style: UIAlertAction.Style.destructive, handler: nil))

        return alert;
    }
    
}
