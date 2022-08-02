//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
@objc(AppInfo)
public class AppInfo :NSObject{
    
    @objc static let shared = AppInfo()
    @objc var category_data:String = ""
    @objc var firebaseConfigFile : String=""
    @objc var client_id : String=""
    @objc var client_secret : String=""
    @objc var platformOS : String=""
    @objc var packageId : String=""
    @objc var version : String=""
    /*Information about appsflyer */
    @objc var afDevKey : String=""
    @objc var afAppId : String=""
    @objc var googleWebClient : String=""
    @objc var locale : String=""
    @objc var hotLinkHomepage : String=""
    @objc var hotLinkFanpage : String=""
    @objc var hotLinkGroup : String=""
    @objc var hotLinkChat : String=""
    @objc var hotline : String=""
    @objc var achievedLevels: NSArray=[]
    @objc var achievedVips: NSArray=[]
    
}
