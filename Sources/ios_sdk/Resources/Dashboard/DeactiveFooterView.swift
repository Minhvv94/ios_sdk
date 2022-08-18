//
//  File.swift
//  
//
//  Created by Minh Vu on 18/08/2022.
//

import Foundation
import UIKit


class DeactiveFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    @objc init(frame: CGRect, editAccess: Int) {
        super.init(frame:frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView(){
        Bundle.module.loadNibNamed("DeactiveFooterView", owner: self, options: nil)
    }
}
