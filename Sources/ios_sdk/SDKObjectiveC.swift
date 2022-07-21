//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation

@objc(SDKObjectiveC)
public class SDKObjectiveC: NSObject {
    
    public override init(){
        print(" ios sdk init")
    }
    
    @objc open func  getSDK() {
        print(" ios sdk getSDK")
    }
   
}
