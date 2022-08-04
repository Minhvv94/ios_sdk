//
//  File.swift
//  
//
//  Created by Minh Vu on 04/08/2022.
//

import Foundation
@objc public protocol MyProc
{
}

@objc public protocol MyFuncProc
{
    func myFunc()
}

public extension MyProc
{
    public func myFunc()
    {
        print("Extension Version")
    }
}
