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

        headerView.backgroundColor = UIColor(hex: "#e13f45")
        let screen = mainView.bounds
        let segmentedControl = BMSegmentedControl.init(
            withIcon: CGRect(x: 0, y: 0, width: headerView.bounds.width * 0.75, height: headerView.bounds.height),
            items: ["Cá nhân", "Tin tức"],
            icons: [UIImage(named: "IconPersonal.png", in: Bundle.module, compatibleWith: nil)!,
                    UIImage(named: "IconNews.png", in: Bundle.module, compatibleWith: nil)!],
            selectedIcons: [UIImage(named: "IconPersonal.png", in: Bundle.module, compatibleWith: nil)!,
                            UIImage(named: "IconNews.png", in: Bundle.module, compatibleWith: nil)!],
            backgroundColor: UIColor.clear,
            thumbColor: UIColor(hex: "#eb5e62"),
            textColor: UIColor(hex: "#FFFFFF"),
            selectedTextColor: UIColor(hex: "#FFFFFF"),
            orientation: ComponentOrientation.topDown)

        segmentedControl.selectedIndex = 0
        self.addPersonal()
        segmentedControl.addTarget(self, action: #selector(self.action(_:)), for: .valueChanged)
        headerView.addSubview(segmentedControl)
    }

    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        
        print("đóng")
        if (self.tag == 102 || self.tag == 103) {
            self.removeFromSuperview()
        }
   }
    


    @objc func action(_ sender: BMSegmentedControl) {
        if (contentView.tag == 103) {
            contentView.removeFromSuperview()
        }
        if sender.selectedIndex == 0 {
            self.addPersonal()
        }else{
            self.addNews()
        }
        print("sender: \(sender.selectedIndex)")
    }
    
    
 
    func addPersonal(){
        let windowWidth = contentView.bounds.width
        let windowHeight = contentView.bounds.height
        let rect = CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight * 0.5)
        let newView = PersonalHeaderView(frame: rect)
        newView.tag = 103
        contentView.addSubview(newView)
    }

    func addNews(){
        let windowWidth = contentView.bounds.width
        let windowHeight = contentView.bounds.height
        let rect = CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight * 0.5)
        let newView = PersonalHeaderView(frame: rect)
        newView.tag = 103
        contentView.addSubview(newView)
    }
    
}
