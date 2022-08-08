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
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        tabItems = [(vc1, "First"), (vc2, "Second")]
        vc1.view.backgroundColor = UIColor.red
        option.tabBackgroundColor = UIColor.green
        option.tabWidth = view.frame.width / CGFloat(tabItems.count)
        option.hidesTopViewOnSwipeType = .all
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
