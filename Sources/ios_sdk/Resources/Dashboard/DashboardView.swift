//
//  DashboardView.swift
//
//
//  Created by Minh Vu on 04/08/2022.
//

import Foundation
import UIKit

@objc(DashboardView)
class DashboardView: UIView {
    let segmentedControl = HMSegmentedControl(items: ["One", "Two", "Three"])
    @IBOutlet var dashboardView: UIView!
    
    @IBOutlet weak var btnBack: UIView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    private func setUpView(){
        Bundle.module.loadNibNamed("DashboardView", owner: self, options: nil)
        self.addSubview(dashboardView)
        dashboardView.frame = self.bounds
        dashboardView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
                
                // 2. add the gesture recognizer to a view
        btnBack.addGestureRecognizer(tapGesture)
        

    }
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if (self.tag == 102) {
            self.removeFromSuperview()
        }
    }

    @objc func action(_ sender: BMSegmentedControl) {
        if (contentView.tag == 103) {
            contentView.removeFromSuperview()
        }
        if sender.selectedIndex == 0 {
            contentView.backgroundColor = UIColor.orange
        }else{
            contentView.backgroundColor = UIColor.black
        }
        print("sender: \(sender.selectedIndex)")
    }
    
    
 
    func addPersonal(){
        let windowWidth = contentView.bounds.width
        let windowHeight = contentView.bounds.height
        let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
        let newView = PersonalHeaderView(frame: rect)
        newView.tag = 103
        contentView.addSubview(newView)
    }

}
