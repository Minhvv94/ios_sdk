//
//  File.swift
//  
//
//  Created by Minh Vu on 25/07/2022.
//

import UIKit


@objc(TestView)
class TestView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc init(frame: CGRect, editAccess: Int) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
