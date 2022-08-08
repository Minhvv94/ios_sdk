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
    
    
    let tabPageView : DashboardTabPageViewController
    
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
        
        
        
    
        mainView.addSubview(tabPageView)
//        let segmentedControl = HMSegmentedControl(sectionTitles: [
//            "Trending",
//            "News",
//            "Library"
//        ])
//
//        segmentedControl.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
//        segmentedControl.addTarget(self, action: #selector(segmentedControlChangedValue(segmentedControl:)), for: .valueChanged)
//        view.addSubview(segmentedControl)
        
//        mainView.overrideUserInterfaceStyle = .light
//        mainView.backgroundColor = .orange
//        mainView.addSubview(viewPager)
//
//        NSLayoutConstraint.activate([
//            viewPager.leftAnchor.constraint(equalTo: mainView.leftAnchor),
//            viewPager.rightAnchor.constraint(equalTo: mainView.rightAnchor),
//            viewPager.topAnchor.constraint(equalTo: mainView.topAnchor),
//            viewPager.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
//        ])
    
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if (self.tag == 102) {
            self.removeFromSuperview()
        }
   }
//    lazy var viewPager: ViewPager = {
//        let viewPager = ViewPager(
//            tabSizeConfiguration: .fillEqually(height: 60, spacing: 0)
//        )
//        let view1 = UIView()
//        view1.backgroundColor = .red
//
//        let view2 = UIView()
//        view2.backgroundColor = .blue
//
//        viewPager.tabbedView.tabs = [
//            AppTabItemView(title: "First"),
//            AppTabItemView(title: "Second")
//        ]
//        viewPager.pagedView.pages = [
//            view1,
//            view2
//        ]
//        viewPager.translatesAutoresizingMaskIntoConstraints = false
//        return viewPager
//    }()
}
