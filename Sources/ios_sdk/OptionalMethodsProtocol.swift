//
//  File.swift
//  
//
//  Created by Minh Vu on 05/09/2022.
//

import Foundation
@objc protocol OptionalMethodsProtocol  {
    func didChooseItem(at index: Int) // Required
    @objc optional func didDismiss() // Optional
}
