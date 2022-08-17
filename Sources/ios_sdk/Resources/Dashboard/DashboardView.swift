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
    let segmentedControl = HMSegmentedControl(items: ["Cá nhân", "Tin tức"])
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
        mainView.addSubview(segmentedControl)


        segmentedControl.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectionIndicatorPosition = .bottom
        segmentedControl.selectionIndicatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        segmentedControl.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)
        ]
        
        segmentedControl.selectedTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.05439098924, green: 0.1344551742, blue: 0.1884709597, alpha: 1),
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)
        ]
        // set mac dinh là tap dau tien
        self.segmentedControl.setSelectedSegmentIndex(0, animated: false)
        self.contentView.backgroundColor = UIColor.orange
        
        segmentedControl.indexChangedHandler = { index in
            if(self.segmentedControl.selectedSegmentIndex == 0){
                self.segmentedControl.setSelectedSegmentIndex(0, animated: false)
                self.contentView.backgroundColor = UIColor.orange
            }else if(self.segmentedControl.selectedSegmentIndex == 1){
                self.segmentedControl.setSelectedSegmentIndex(1, animated: false)
                self.contentView.backgroundColor = UIColor.black
            }else{
                self.segmentedControl.setSelectedSegmentIndex(0, animated: false)
                self.contentView.backgroundColor = UIColor.orange
            }
        }
        segmentedControl.frame = CGRect(x: 0, y: 0, width: self.headerView.bounds.size.width, height: self.headerView.bounds.size.height)
        print("width \(self.headerView.bounds.size.width)")
        print("height \(self.headerView.bounds.size.height)")
//        NSLayoutConstraint.activate([
//            segmentedControl.widthAnchor.constraint(equalTo: mainView.widthAnchor),
//            segmentedControl.heightAnchor.constraint(equalTo: headerView.heightAnchor * 0.7),
//            segmentedControl.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
//            segmentedControl.topAnchor.constraint(equalTo: mainView.topAnchor)
//        ])
        
    }

    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if (self.tag == 102) {
            self.removeFromSuperview()
        }
   }
    func viewDidAppear(_ animated: Bool) {
        segmentedControl.setSelectedSegmentIndex(2, animated: false)
    }


//
//    @objc func action(_ sender: HMSegmentedControl) {
////        if (contentView.tag == 103) {
////            contentView.removeFromSuperview()
////        }
//        if sender.selectedSegmentIndex == 0 {
//            contentView.backgroundColor = UIColor.orange
//        }else{
//            contentView.backgroundColor = UIColor.black
//        }
//        print("sender: \(sender.selectedSegmentIndex)")
//    }
//
    
 
    func addPersonal(){
        let windowWidth = contentView.bounds.width
        let windowHeight = contentView.bounds.height
        let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
        let newView = PersonalHeaderView(frame: rect)
        newView.tag = 103
        contentView.addSubview(newView)
    }

}
