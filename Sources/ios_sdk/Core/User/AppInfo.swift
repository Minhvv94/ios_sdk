//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
@objc(AppInfo)
public class AppInfo :NSObject{
    static let KEY_FIREBASE_CONFIG_FILE = "KEY_FIREBASE_CONFIG_FILE"
    static let KEY_CLIENT_ID = "KEY_CLIENT_ID"
    static let KEY_CLIENT_SECRET = "KEY_CLIENT_SECRET"
    static let KEY_PLATFORM_OS = "KEY_PLATFORM_OS"
    static let KEY_PACKAGE_ID = "KEY_PACKAGE_ID"
    static let KEY_VERSION = "KEY_VERSION"
    static let KEY_APP_ID = "KEY_APP_ID"
    
    static let shared = AppInfo()
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
    
    
    var defaults: UserDefaults?;
    //getToken
    func setfirebaseConfigFile(firebaseConfigFile: String) {
        defaults?.set(firebaseConfigFile, forKey: AppInfo.KEY_FIREBASE_CONFIG_FILE)
    }
    func getfirebaseConfigFile() -> String? {
        return defaults?.string(forKey: AppInfo.KEY_FIREBASE_CONFIG_FILE)
    }
    func setClientId(clientId: String) {
        defaults?.set(clientId, forKey: AppInfo.KEY_CLIENT_ID)
    }
    func getClientId() -> String? {
        return defaults?.string(forKey: AppInfo.KEY_CLIENT_ID)
    }
    func setClientSecret(clientSecret: String) {
        defaults?.set(clientSecret, forKey: AppInfo.KEY_CLIENT_SECRET)
    }
    func getClientSecret() -> String? {
        return defaults?.string(forKey: AppInfo.KEY_CLIENT_SECRET)
    }
    func setPlatformOS(platformOS: String) {
        defaults?.set(platformOS, forKey: AppInfo.KEY_PLATFORM_OS)
    }
    func getPlatformOS() -> String? {
        return defaults?.string(forKey: AppInfo.KEY_PLATFORM_OS)
    }
    func setVersionId(versionId: String) {
        defaults?.set(versionId, forKey: AppInfo.KEY_VERSION)
    }
    func getVersionId() -> String? {
        return defaults?.string(forKey: AppInfo.KEY_VERSION)
    }
    func setAppId(appId: String) {
        defaults?.set(appId, forKey: AppInfo.KEY_APP_ID)
    }
    func getAppId() -> String? {
        return defaults?.string(forKey: AppInfo.KEY_APP_ID)
    }
    

    
    @objc open func  updateData(model: AppInfo?) {
        setfirebaseConfigFile(firebaseConfigFile: model?.firebaseConfigFile ?? "")
        setClientId(clientId: model?.client_id ?? "")
        setClientSecret(clientSecret: model?.client_secret ?? "")
        setPlatformOS(platformOS: model?.platformOS ?? "")
        setVersionId(versionId: model?.version ?? "")
        setAppId(appId: model?.afAppId ?? "")
    }
    
}
