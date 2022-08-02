//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
@objc(AppInfo)
public class AppInfo :NSObject{
    
    public static let shared = AppInfo()
    @objc public var category_data:String = ""
    @objc var firebaseConfigFile : String=""
    var client_id : String=""
    var client_secret : String=""
    var platformOS : String=""
    var packageId : String=""
    var version : String=""
    /*Information about appsflyer */
    var afDevKey : String=""
    var afAppId : String=""
    var googleWebClient : String=""
    var locale : String=""
    var hotLinkHomepage : String=""
    var hotLinkFanpage : String=""
    var hotLinkGroup : String=""
    var hotLinkChat : String=""
    var hotline : String=""
    var achievedLevels: NSArray=[]
    var achievedVips: NSArray=[]
    
}
