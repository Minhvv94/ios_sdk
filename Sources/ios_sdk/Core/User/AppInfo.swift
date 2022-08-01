//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
@objc
public protocol AppInfo {
    
//    static let shared = AppInfo()
    
    var firebaseConfigFile : String{ get set }
    var client_id : String{ get set }
    var client_secret : String{ get set }
    var platformOS : String{ get set }
    var packageId : String{ get set }
    var version : String{ get set }
    /*Information about appsflyer */
    var afDevKey : String{ get set }
    var afAppId : String{ get set }
    var googleWebClient : String{ get set }
    var locale : String{ get set }
    var hotLinkHomepage : String{ get set }
    var hotLinkFanpage : String{ get set }
    var hotLinkGroup : String{ get set }
    var hotLinkChat : String{ get set }
    var hotline : String{ get set }
    var achievedLevels: NSArray{ get set }
    var achievedVips: NSArray{ get set }
    
}
