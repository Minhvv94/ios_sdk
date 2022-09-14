//
//  File.swift
//  
//
//  Created by Minh Vu on 14/09/2022.
//

import Foundation

import UIKit


class ViewTest : UIView {
    
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
        if Utils.isLandscape {
            Bundle.module.loadNibNamed("ViewTestH", owner: self, options: nil)
        }else{
            Bundle.module.loadNibNamed("ViewTestV", owner: self, options: nil)
        }
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    @IBOutlet var contentView: ViewTest!
    
    @IBAction func btnLogin(_ sender: Any) {
        
        print("hi minh vu")
    }
}
