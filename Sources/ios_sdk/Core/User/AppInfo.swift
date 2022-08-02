//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
@objc(AppInfo)
public class AppInfo :NSObject{
    
    @objc public static let shared = AppInfo()
    @objc public var firebaseConfigFile : String=""
    @objc public var client_id : String=""
    @objc public var client_secret : String=""
    @objc public var platformOS : String=""
    @objc public var packageId : String=""
    @objc public var version : String=""
    /*Information about appsflyer */
    @objc public var afDevKey : String=""
    @objc public var afAppId : String=""
    @objc public var googleWebClient : String=""
    @objc public var locale : String=""
    @objc public var hotLinkHomepage : String=""
    @objc public var hotLinkFanpage : String=""
    @objc public var hotLinkGroup : String=""
    @objc public var hotLinkChat : String=""
    @objc public var hotline : String=""
    @objc public var achievedLevels: NSArray=[]
    @objc public var achievedVips: NSArray=[]
    
}
