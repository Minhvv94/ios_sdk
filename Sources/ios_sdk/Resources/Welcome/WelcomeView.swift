//
//  WelcomeView.swift
//  
//
//  Created by Minh Vu on 07/09/2022.
//

import Foundation
import UIKit

@objc(WelcomeView)
class WelcomeView: UIView {
    var timer : DispatchSourceTimer!
    var counter : Int = 0
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbWelcomeUser: UILabel!
    
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
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
    }
    @objc func sayHi(accountName : String){
        let webcome = "Xin chào, " + accountName
        lbWelcomeUser.text = webcome
    }
    
    
    func show(){
        if timer != nil {
            hide()
        }
        easyIn()
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: .now() + .seconds(3), repeating: .seconds(1), leeway: .seconds(1))
        timer?.setEventHandler(handler: {
            self.hide()
        })
        timer?.resume()
        
        
        
    }
    
    
    @objc public func hide(){
        DispatchQueue.main.async {
            self.contentView.removeFromSuperview()
        }
        self.timer?.cancel()
        self.timer = nil
    }
    
    public func easyIn(){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(.easeIn)
        UIView.setAnimationDuration(0.2)
        contentView.alpha = 1.0
        UIView.commitAnimations()
    }
}

