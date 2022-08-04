//
//  BmoViewPagerDataSource.swift
//  
//
//  Created by Minh Vu on 04/08/2022.
//

import Foundation
import UIKit

@objc public protocol BmoViewPagerDataSource {
    func bmoViewPagerDataSource() -> Int
}

@objc public protocol BmoViewPagerDelegate {
    @objc optional func bmoViewPagerDelegate()
}

@IBDesignable

public class BmoViewPager{
    
}
