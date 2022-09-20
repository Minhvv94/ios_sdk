//
//  File.swift
//  
//
//  Created by Minh Vu on 25/07/2022.
//

import UIKit


@objc(TestView)
class TestView: UIView {


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
        
        
        if Utils.isLandscape {
           Bundle.module.loadNibNamed("TestView", owner: self, options: nil)
        
        }else{
            Bundle.module.loadNibNamed("Test2View", owner: self, options: nil)
        }
        
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }

    @IBAction func btnTest(_ sender: Any) {
        print(" hi minh 2")
        
//        if Utils.isLandscape {
//            Bundle.module.loadNibNamed("Test2View", owner: self, options: nil)
//        }
        
        

    }
    @IBAction func btnLogin(_ sender: Any) {
        print(" hi minh")
        if (self.tag == TagConst.TAG_VIEW_TEST) {
            self.removeFromSuperview()
        }
        
//        if !Utils.isLandscape {
//            Bundle.module.loadNibNamed("TestView", owner: self, options: nil)
//        }
    }
}
