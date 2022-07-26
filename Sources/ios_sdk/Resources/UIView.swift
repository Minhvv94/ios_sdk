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

    private var hideKeybordOnTapIdentifier: String { return "hideKeybordOnTapIdentifier" }

    private var hideKeybordOnTapGestureRecognizer: TapGestureRecognizer? {
        let hideKeyboardGesture = TapGestureRecognizer(target: self, action: #selector(UIView.hideKeyboard),
                                                       identifier: hideKeybordOnTapIdentifier)
        if let gestureRecognizers = self.gestureRecognizers {
            for gestureRecognizer in gestureRecognizers {
                if let tapGestureRecognizer = gestureRecognizer as? TapGestureRecognizer,
                    tapGestureRecognizer == hideKeyboardGesture {
                    return tapGestureRecognizer
                }
            }
        }
        return nil
    }

    @objc private func hideKeyboard() { endEditing(true) }

    var hideKeyboardOnTap: Bool {
        set {
            let hideKeyboardGesture = TapGestureRecognizer(target: self, action: #selector(hideKeyboard),
                                                           identifier: hideKeybordOnTapIdentifier)
            if let hideKeybordOnTapGestureRecognizer = hideKeybordOnTapGestureRecognizer {
                removeGestureRecognizer(hideKeybordOnTapGestureRecognizer)
                if gestureRecognizers?.count == 0 { gestureRecognizers = nil }
            }
            if newValue { addGestureRecognizer(hideKeyboardGesture) }
        }
        get { return hideKeybordOnTapGestureRecognizer == nil ? false : true }
    }
}
