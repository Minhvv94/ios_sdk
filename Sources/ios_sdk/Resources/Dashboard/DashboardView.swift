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
        
        
        mainView.addSubview(segmentedControlContainerView)
                    segmentedControlContainerView.addSubview(segmentedControl)
                    segmentedControlContainerView.addSubview(bottomUnderlineView)
        
    // Constrain the container view to the view controller
    let safeLayoutGuide = mainView.safeAreaLayoutGuide
       NSLayoutConstraint.activate([
            segmentedControlContainerView.topAnchor.constraint(equalTo: mainView.topAnchor),
            segmentedControlContainerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            segmentedControlContainerView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            segmentedControlContainerView.heightAnchor.constraint(equalTo: headerView.heightAnchor)
        ])
        
//                    // Constrain the segmented control to the container view
                    NSLayoutConstraint.activate([
                        segmentedControl.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
                        segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor+10),
                        segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
                        segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
                        ])
//
//                    // Constrain the underline view relative to the segmented control
                    NSLayoutConstraint.activate([
                        bottomUnderlineView.topAnchor.constraint(equalTo: segmentedControl.topAnchor),
                        bottomUnderlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
                        leadingDistanceConstraint,
                        bottomUnderlineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
                        ])

    
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if (self.tag == 102) {
            self.removeFromSuperview()
        }
   }
//    lazy var viewPager: ViewPager = {
//        let viewPager = ViewPager(
//            tabSizeConfiguration: .fillEqually(height: 50, spacing: 0)
//
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
    
    
    private enum Constants {
            static let segmentedControlHeight: CGFloat = 60
            static let underlineViewColor: UIColor = .blue
            static let underlineViewHeight: CGFloat = 2
        }

        // Container view of the segmented control
        private lazy var segmentedControlContainerView: UIView = {
            let containerView = UIView()
            containerView.backgroundColor = .clear
            containerView.translatesAutoresizingMaskIntoConstraints = false
            return containerView
        }()

        // Customised segmented control
        private lazy var segmentedControl: UISegmentedControl = {
            let segmentedControl = UISegmentedControl()

            // Remove background and divider colors
            segmentedControl.backgroundColor = .clear
            segmentedControl.tintColor = .clear

            // Append segments
            segmentedControl.insertSegment(withTitle: "First", at: 0, animated: true)
            segmentedControl.insertSegment(withTitle: "Second", at: 1, animated: true)

            // Select first segment by default
            segmentedControl.selectedSegmentIndex = 0

            // Set up event handler to get notified when the selected segment changes
            segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)

            // Return false because we will set the constraints with Auto Layout
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            return segmentedControl
        }()

        // The underline view below the segmented control
        private lazy var bottomUnderlineView: UIView = {
            let underlineView = UIView()
            underlineView.backgroundColor = Constants.underlineViewColor
            underlineView.translatesAutoresizingMaskIntoConstraints = false
            return underlineView
        }()

        private lazy var leadingDistanceConstraint: NSLayoutConstraint = {
            return bottomUnderlineView.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor)
        }()
        @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
            changeSegmentedControlLinePosition()
        }

        // Change position of the underline
        private func changeSegmentedControlLinePosition() {
            let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
            let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
            let leadingDistance = segmentWidth * segmentIndex
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.leadingDistanceConstraint.constant = leadingDistance
                self?.layoutIfNeeded()
            })
        }
}
