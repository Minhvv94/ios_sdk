//
//  File.swift
//  
//
//  Created by Minh Vu on 05/09/2022.
//

import Foundation
public class OptionalMethodsProtocolExten2 : OptionalMethodsProtocol {
    func didChooseItem(at index: Int) {
        print("hi protocol didChooseItem 2")
    }
    
    
    @objc func didDismiss(){
        print("hi protocol didDismiss 2")
    }
    
    
}
