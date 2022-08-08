//
//  File.swift
//  
//
//  Created by Minh Vu on 08/08/2022.
//

import Foundation
class First: : UIView {
    
    var userDefault = UserDefaults.standard
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpView(){
        Bundle.module.loadNibNamed("LoginView", owner: self, options: nil)
//        self.addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }

}

