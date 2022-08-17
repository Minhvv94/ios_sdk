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
        
        segmentedControl.backgroundColor = #colorLiteral(red: 0.7683569193, green: 0.9300123453, blue: 0.9995251894, alpha: 1)
                segmentedControl.translatesAutoresizingMaskIntoConstraints = false
                segmentedControl.selectionIndicatorPosition = .bottom
                segmentedControl.selectionIndicatorColor = #colorLiteral(red: 0.1142767668, green: 0.3181744218, blue: 0.4912756383, alpha: 1)
                
                segmentedControl.titleTextAttributes = [
                    NSForegroundColorAttributeName : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                    NSFontAttributeName : UIFont.systemFont(ofSize: 17)
                ]
                
                segmentedControl.selectedTitleTextAttributes = [
                    NSForegroundColorAttributeName : #colorLiteral(red: 0.05439098924, green: 0.1344551742, blue: 0.1884709597, alpha: 1),
                    NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)
                ]
                
                segmentedControl.indexChangedHandler = { index in
                    print(index)
        //            print(self.segmentedControl.selectedSegmentIndex)
        //            self.segmentedControl.selectedSegmentIndex = 1
                }
                
                NSLayoutConstraint.activate(
                    [segmentedControl.leftAnchor.constraint(equalTo: mainView.leftAnchor),
                     segmentedControl.heightAnchor.constraint(equalToConstant: 50),
                     segmentedControl.rightAnchor.constraint(equalTo: mainView.rightAnchor),
                     segmentedControl.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 40)]
                )
        

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
