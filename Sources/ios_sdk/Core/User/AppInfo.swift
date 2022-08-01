//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
@objc
public class AppInfo: NSObject {
    
    static let shared = AppInfo()
    
    public var firebaseConfigFile : String? = nil
    public var client_id : String? = nil
    public var client_secret : String? = nil
    var platformOS : String? = nil
    var packageId : String? = nil
    var version : String = ""
    /*Information about appsflyer */
    var afDevKey : String? = nil
    var afAppId : String? = nil
    var googleWebClient : String? = nil
    var locale : String? = nil
    var hotLinkHomepage : String? = nil
    var hotLinkFanpage : String? = nil
    var hotLinkGroup : String? = nil
    var hotLinkChat : String = ""
    var hotline : String? = nil
    var achievedLevels: NSArray? = nil
    var achievedVips: NSArray? = nil
    
}
