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
        
//        mainView.overrideUserInterfaceStyle = .light
//        mainView.addSubview(viewPager)
//
//
//
//        NSLayoutConstraint.activate([
//            viewPager.widthAnchor.constraint(equalTo: mainView.widthAnchor),
//            viewPager.heightAnchor.constraint(equalTo: mainView.heightAnchor),
//            viewPager.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
//            viewPager.topAnchor.constraint(equalTo: mainView.topAnchor)
//        ])
//        viewPager.translatesAutoresizingMaskIntoConstraints = false
        let screen = mainView.bounds
        let segmentedControl = BMSegmentedControl.init(
            withIcon: CGRect(x: 0, y: 0, width: screen.width, height: headerView.bounds.height),
            items: ["Happy", "Normal"],
            icons: [UIImage(named: "IconPersonal.png", in: Bundle.module, compatibleWith: nil)!,
                    UIImage(named: "IconNews.png", in: Bundle.module, compatibleWith: nil)!],
            selectedIcons: [UIImage(named: "IconPersonal.png", in: Bundle.module, compatibleWith: nil)!,
                            UIImage(named: "IconNews.png", in: Bundle.module, compatibleWith: nil)!],
            backgroundColor: UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1),
            thumbColor: UIColor.init(hex: "#54C3EF"),
            textColor: UIColor(hex: "#808080"),
            selectedTextColor: UIColor(hex: "#FFFFFF"),
            orientation: ComponentOrientation.topDown)

        segmentedControl.selectedIndex = 0
        contentView.backgroundColor = UIColor.orange
        segmentedControl.addTarget(self, action: #selector(self.action(_:)), for: .valueChanged)
        headerView.addSubview(segmentedControl)
    }

    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if (self.tag == 102) {
            self.removeFromSuperview()
        }
   }
    


    @objc func action(_ sender: BMSegmentedControl) {
//        if (mainView.tag == 103) {
//            mainView.removeFromSuperview()
//        }
//        let windowWidth = mainView.bounds.width
//        let windowHeight = mainView.bounds.height
//
//        print("\(windowWidth)")
//        print("\(windowHeight)")
//
//
//        let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)

        
        if sender.selectedIndex == 0 {
            contentView.backgroundColor = UIColor.orange
        }else{
            contentView.backgroundColor = UIColor.black
        }
        print("sender: \(sender.selectedIndex)")
    }

}
