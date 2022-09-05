//
//  File.swift
//  
//
//  Created by Minh Vu on 05/09/2022.
//

import Foundation



@objc(OptionalMethodsProtocol)
protocol OptionalMethodsProtocol {
    func didChooseItem(at index: Int) // Required
    @objc func didDismiss() // Optional
}

extension OptionalMethodsProtocol {
    func didChooseItem(at index: Int) {
        print("OK, let's go!")
    }
    
    func didDismiss(){
        print("OK, let's go! didDismiss")
    }
}
