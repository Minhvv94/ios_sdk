//
//  File.swift
//  
//
//  Created by Minh Vu on 14/09/2022.
//

import Foundation

import UIKit

@objc(ViewTest)
class ViewTest : UIView {
    
    @IBOutlet var contentView: UIView!
    
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

        Bundle.module.loadNibNamed("ViewTestH", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    

    
    @IBAction func btnLogin(_ sender: Any) {
        
        print("hi minh vu")
    }
}
