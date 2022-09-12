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

extension UIView {

    
    
    func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
      }
    
    func anchor(top : NSLayoutYAxisAnchor? , paddingTop : CGFloat ,
                   bottom : NSLayoutYAxisAnchor? , paddingBottom : CGFloat ,
                   left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat,
                   right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
           
           translatesAutoresizingMaskIntoConstraints = false
           
           if let top = top {
               topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
           }
           
           if let bottom = bottom {
               bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
           }
           
           if let left = left {
               leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
           }
           
           if let right = right {
               trailingAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
           }
           
           if  width != 0 {
               widthAnchor.constraint(equalToConstant: width).isActive = true
           }
           
           if  height != 0 {
               heightAnchor.constraint(equalToConstant: height).isActive = true
           
           }
       }
}
