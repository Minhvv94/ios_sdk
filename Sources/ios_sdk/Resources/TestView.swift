//
//  File.swift
//  
//
//  Created by Minh Vu on 25/07/2022.
//

import UIKit


@objc(TestView)
class TestView: UIView {

    @IBOutlet weak var textSayHi: UILabel!
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
        Bundle.module.loadNibNamed("TestView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    func sayHi(accountName : String){
        textSayHi.text = accountName
        
    }
}
