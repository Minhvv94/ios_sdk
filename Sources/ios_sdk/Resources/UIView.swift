//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
import UIKit
//
//extension UIView {
//    public class func fromNib(named: String? = nil) -> Self {
//        let name = named ?? "\(Self.self)"
//        guard
//
//            //let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
//            let nib = Bundle.module.loadNibNamed(name, owner: nil, options: nil)
//            else { fatalError("missing expected nib named: \(name)") }
//        guard
//            /// we're using `first` here because compact map chokes compiler on
//            /// optimized release, so you can't use two views in one nib if you wanted to
//            /// and are now looking at this
//            let view = nib.first as? Self
//            else { fatalError("view of type \(Self.self) not found in \(nib)") }
//        return view
//    }
//}
//

//extension UIView {
//    
//    func addTapGesture(action : @escaping ()->Void ){
//        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
//        tap.action = action
//        tap.numberOfTapsRequired = 1
//        
//        self.addGestureRecognizer(tap)
//        self.isUserInteractionEnabled = true
//        
//    }
//    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
//        sender.action!()
//    }
//}
//
//class MyTapGestureRecognizer: UITapGestureRecognizer {
//    var action : (()->Void)? = nil
//}
extension UIView {

    func bindToKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(UIView.keyboardWillChange(notification:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }

    func unbindToKeyboard() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }

    @objc func keyboardWillChange(notification: Notification) {
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let curFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y

        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        })
    }

}
