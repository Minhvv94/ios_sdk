//
//  File.swift
//  
//
//  Created by Minh Vu on 05/09/2022.
//

import Foundation
public class OptionalMethodsProtocolExten : OptionalMethodsProtocol {
    func didChooseItem(at index: Int) {
        print("hi protocol didChooseItem")
    }
    
    
    func didDismiss(){
        print("hi protocol didDismiss")
    }
    
    
}
