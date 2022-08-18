//
//  PersonalHeaderView.swift
//  
//
//  Created by Minh Vu on 09/08/2022.
//

import Foundation
import UIKit


class PersonalHeaderView: UIView {
    
    @IBOutlet var contentHeaderView: UIView!
    
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
        Bundle.module.loadNibNamed("PersonalHeaderView", owner: self, options: nil)
        self.addSubview(contentHeaderView)
        contentHeaderView.frame = self.bounds
        contentHeaderView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
}
