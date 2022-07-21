//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation

protocol SwiftProtocol {
    func login()
    func loginTest()
}

@objc class SDKObjectiveC: NSObject, SwiftProtocol {
    
    @objc func login(){
        print("call SDKObjectiveC framework ")
    }
    
    @objc func loginTest(){
        print("call SDKObjectiveC framework loginTest")
    }
}
