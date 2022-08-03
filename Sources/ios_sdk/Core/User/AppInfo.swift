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
    
    
//    var defaults: UserDefaults?;
    static var AppInforKey = "com.vtvlive.vn"
    var userDefault = UserDefaults.standard
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
    

    
    @objc open func  updateData(model: AppInfo?) {
        setfirebaseConfigFile(firebaseConfigFile: model?.firebaseConfigFile ?? "")
        setClientId(client_id: model?.client_id ?? "")
        setClientSecret(client_secret: model?.client_secret ?? "")
        setPlatformOS(platformOS: model?.platformOS ?? "")
        setVersionId(versionId: model?.version ?? "")
        setAppId(appId: model?.afAppId ?? "")
    }
    @objc open func  saveUpdateData(model: AppInfo?) {
        userDefault.set(model, forKey: AppInfo.AppInforKey)
    }
    
}
