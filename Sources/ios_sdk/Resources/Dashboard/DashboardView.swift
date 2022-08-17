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
        
        mainView.overrideUserInterfaceStyle = .light
//        mainView.addSubview(viewPager)
//
//
//
//        NSLayoutConstraint.activate([
//            viewPager.widthAnchor.constraint(equalTo: mainView.widthAnchor),
//            viewPager.heightAnchor.constraint(equalTo: c.heightAnchor),
//            viewPager.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
//            viewPager.topAnchor.constraint(equalTo: mainView.topAnchor)
//        ])
//        viewPager.translatesAutoresizingMaskIntoConstraints = false
        
        
//        let screen = mainView.bounds
//        let segmentedControl = BMSegmentedControl.init(
//            withIcon: CGRect(x: 0, y: 0, width: screen.width, height: headerView.bounds.height),
//            items: ["Happy", "Normal"],
//            icons: [UIImage(named: "IconPersonal.png", in: Bundle.module, compatibleWith: nil)!,
//                    UIImage(named: "IconNews.png", in: Bundle.module, compatibleWith: nil)!],
//            selectedIcons: [UIImage(named: "IconPersonal.png", in: Bundle.module, compatibleWith: nil)!,
//                            UIImage(named: "IconNews.png", in: Bundle.module, compatibleWith: nil)!],
//            backgroundColor: UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1),
//            thumbColor: UIColor.init(hex: "#54C3EF"),
//            textColor: UIColor(hex: "#808080"),
//            selectedTextColor: UIColor(hex: "#FFFFFF"),
//            orientation: ComponentOrientation.topDown)
//
//        segmentedControl.selectedIndex = 0
//        contentView.backgroundColor = UIColor.orange
//        segmentedControl.addTarget(self, action: #selector(self.action(_:)), for: .valueChanged)
//        headerView.addSubview(segmentedControl)


        segmentedControl.backgroundColor = #colorLiteral(red: 0.7683569193, green: 0.9300123453, blue: 0.9995251894, alpha: 1)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectionIndicatorPosition = .bottom
        segmentedControl.selectionIndicatorColor = #colorLiteral(red: 0.1142767668, green: 0.3181744218, blue: 0.4912756383, alpha: 1)
        
        segmentedControl.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)
        ]
        
        segmentedControl.selectedTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.05439098924, green: 0.1344551742, blue: 0.1884709597, alpha: 1),
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)
        ]
        
        segmentedControl.indexChangedHandler = { index in
            print(index)
//            print(self.segmentedControl.selectedSegmentIndex)
//            self.segmentedControl.selectedSegmentIndex = 1
        }
        
                NSLayoutConstraint.activate([
                    segmentedControl.widthAnchor.constraint(equalTo: mainView.widthAnchor),
                    segmentedControl.heightAnchor.constraint(equalTo: mainView.heightAnchor),
                    segmentedControl.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
                    segmentedControl.topAnchor.constraint(equalTo: mainView.topAnchor)
                ])
        
    }

    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if (self.tag == 102) {
            self.removeFromSuperview()
        }
   }
//    override func viewDidAppear(_ animated: Bool) {
//        segmentedControl.setSelectedSegmentIndex(2, animated: false)
//    }



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
