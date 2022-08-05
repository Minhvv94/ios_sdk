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
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var btnBack: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    private func setUpView(){
        Bundle.module.loadNibNamed("DashboardView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
                
                // 2. add the gesture recognizer to a view
        btnBack.addGestureRecognizer(tapGesture)
        
        self.overrideUserInterfaceStyle = .light
        self.backgroundColor = .white
        self.addSubview(viewPager)
        
        NSLayoutConstraint.activate([
            viewPager.widthAnchor.constraint(equalTo: self.widthAnchor),
            viewPager.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            viewPager.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewPager.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        ])
    
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if (self.tag == 102) {
            self.removeFromSuperview()
        }
   }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        self.navigationItem.title = "ViewPager"
//
//        self.navigationController?.navigationBar.standardAppearance.backgroundColor = .systemBlue
//        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    lazy var viewPager: ViewPager = {
        let viewPager = ViewPager(
            tabSizeConfiguration: .fillEqually(height: 60, spacing: 0)
        )
        let view1 = UIView()
        view1.backgroundColor = .red
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = UIView()
        view3.backgroundColor = .orange
        
        viewPager.tabbedView.tabs = [
            AppTabItemView(title: "First"),
            AppTabItemView(title: "Second"),
            AppTabItemView(title: "Third")
        ]
        viewPager.pagedView.pages = [
            view1,
            view2,
            view3
        ]
        viewPager.translatesAutoresizingMaskIntoConstraints = false
        return viewPager
    }()
}
