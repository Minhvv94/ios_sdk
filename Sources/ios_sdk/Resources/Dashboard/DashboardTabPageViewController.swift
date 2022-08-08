//
//  File.swift
//  
//
//  Created by Minh Vu on 08/08/2022.
//

import Foundation
import UIKit

class DashboardTabPageViewController : TabPageViewController {
    
    override init() {
        super.init()
        
        let windowWidth = self.view.frame.width
        let windowHeight = self.view.frame.height
        let rect = CGRect(x: 0, y: 0, width: windowWidth , height: windowHeight)
        let vc1 = TestView(frame: rect)
        let vc2 = TestView(frame: rect)
        tabItems = [(vc1, "First"), (vc2, "Second")]
        option.tabBackgroundColor = UIColor.green
        option.tabWidth = view.frame.width / CGFloat(tabItems.count)
        option.hidesTopViewOnSwipeType = .all
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
