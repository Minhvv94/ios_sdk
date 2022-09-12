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
    var counter = 0
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
        
        self.closeWelcome()
        
    }
    
    func closeWelcome(){
        timer = DispatchSource.makeTimerSource()
        timer.schedule(deadline: .now() + .seconds(1), repeating: .seconds(1), leeway: .seconds(1))
            timer.setEventHandler(handler: { [weak self] in
                guard let strongSelf = self else { return }
                counter += 1
                if counter == 2 {
                    if (self.tag == 107) {
                        self.removeFromSuperview()
                    }
                }
            })

        timer.resume()
    }
}

