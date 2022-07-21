//
//  File.swift
//  
//
//  Created by Minh Vu on 21/07/2022.
//

import Foundation


extension NSObject {
    
    class func getSDK() {
        print(" ios sdk getSDK")
    }
    
}

@objc(SDKObjectiveC)
public class SDKObjectiveC: NSObject {
    
    public override init(){
        print(" ios sdk init")
    }
   
    public func getSDK () {
        print(" ios sdk getSDK")
    }
}
