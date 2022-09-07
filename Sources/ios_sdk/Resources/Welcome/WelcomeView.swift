//
//  WelcomeView.swift
//  
//
//  Created by Minh Vu on 07/09/2022.
//

import Foundation
import UIKit
class WelcomeView: UIView {

    
    @IBOutlet weak var lbWebcomeUser: UILabel!
    
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
        Bundle.module.loadNibNamed("WelcomeView", owner: self, options: nil)
    
    }
    func sayHi(accountName : String){
        print("Chào mừng ", accountName)
        
        lbWebcomeUser.attributedText("Chào mừng Minh vu")
    }
}

