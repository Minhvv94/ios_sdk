//
//  File.swift
//  
//
//  Created by Minh Vu on 19/07/2022.
//

import Foundation
@objc(AppInfo)
public class AppInfo : NSObject{
    static let KEY_FIREBASE_CONFIG_FILE = "KEY_FIREBASE_CONFIG_FILE"
    static let KEY_CLIENT_ID = "KEY_CLIENT_ID"
    static let KEY_CLIENT_SECRET = "KEY_CLIENT_SECRET"
    static let KEY_PLATFORM_OS = "KEY_PLATFORM_OS"
    static let KEY_PACKAGE_ID = "KEY_PACKAGE_ID"
    static let KEY_VERSION = "KEY_VERSION"
    static let KEY_APP_ID = "KEY_APP_ID"
    
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

    var userDefault = UserDefaults.standard
    static let shared = AppInfo()

    
    @objc public func updateData(firebaseConfigFile: String?, client_id: String?, client_secret: String?, platformOS : String?,
         packageId : String?, version: String?) {
        self.firebaseConfigFile = firebaseConfigFile ?? ""
        self.client_id = client_id ?? ""
        self.client_secret = client_secret ?? ""
        self.platformOS = platformOS ?? ""
        self.packageId = packageId ?? ""
        self.version = version ?? ""
    }
    
    
    //getToken
    @objc public func setfirebaseConfigFile(firebaseConfigFile: String) {
        userDefault.set(firebaseConfigFile, forKey: AppInfo.KEY_FIREBASE_CONFIG_FILE)
    }
    func getfirebaseConfigFile() -> String? {
        return userDefault.string(forKey: AppInfo.KEY_FIREBASE_CONFIG_FILE) ?? ""
    }
    @objc public func setClientId(client_id: String) {
        userDefault.set(client_id, forKey: AppInfo.KEY_CLIENT_ID)
    }
    public func getClientId() -> String? {
        return userDefault.string(forKey: AppInfo.KEY_CLIENT_ID) ?? ""
    }
    @objc public func setClientSecret(client_secret: String) {
        userDefault.set(client_secret, forKey: AppInfo.KEY_CLIENT_SECRET)
    }
    func getClientSecret() -> String? {
        return userDefault.string(forKey: AppInfo.KEY_CLIENT_SECRET) ?? ""
    }
    @objc public func setPlatformOS(platformOS: String) {
        userDefault.set(platformOS, forKey: AppInfo.KEY_PLATFORM_OS)
    }
    func getPlatformOS() -> String? {
        return userDefault.string(forKey: AppInfo.KEY_PLATFORM_OS) ?? ""
    }
    @objc public func setVersionId(versionId: String) {
        userDefault.set(versionId, forKey: AppInfo.KEY_VERSION)
    }
    func getVersionId() -> String? {
        return userDefault.string(forKey: AppInfo.KEY_VERSION) ?? ""
    }
    @objc public func setAppId(appId: String) {
        userDefault.set(appId, forKey: AppInfo.KEY_APP_ID)
    }
    func getAppId() -> String? {
        return userDefault.string(forKey: AppInfo.KEY_APP_ID) ?? ""
    }
    
    @objc open func save() {
        setClientId(client_id: self.client_id)
        setClientSecret(client_secret: self.client_secret)
        setfirebaseConfigFile(firebaseConfigFile: self.firebaseConfigFile)
        setPlatformOS(platformOS: self.platformOS)
        setVersionId(versionId: self.version)
        setAppId(appId: self.afAppId)
    }
    
}
