//
//  UserManager.swift
//  ITapSdkVTVLive
//
//  Created by Minh Vu on 04/07/2022.
//

import Foundation
class UserManager: NSObject {
    static let KEY_USER_ID = "KEY_USER_ID"
    static let KEY_DEVICE_TOKEN = "KEY_DEVICE_TOKEN"
    static let KEY_TOKEN = "KEY_TOKEN"
    static let KEY_REFRESH_TOKEN = "KEY_REFRESH_TOKEN"

    var defaults: UserDefaults?;
    
    static let shared = UserManager()
    
    
    //get access_token
    func setToken(token: String) {
        defaults?.set(token, forKey: UserManager.KEY_TOKEN)
    }
    
    func getToken() -> String? {
        return defaults?.string(forKey: UserManager.KEY_TOKEN)
    }
    
    func clearToken() {
        defaults?.set(nil, forKey: UserManager.KEY_TOKEN)
    }
    
    //get access_token
    func setRefreshToken(refreshToken: String) {
        defaults?.set(refreshToken, forKey: UserManager.KEY_REFRESH_TOKEN)
    }
    
    func getRefreshToken() -> String? {
        return defaults?.string(forKey: UserManager.KEY_REFRESH_TOKEN)
    }
    
    func clearRefreshToken() {
        defaults?.set(nil, forKey: UserManager.KEY_REFRESH_TOKEN)
    }
    
    // Device Token ==============================================
    func setDeviceToken(deviceToken: String) {
        defaults?.set(deviceToken, forKey: UserManager.KEY_DEVICE_TOKEN)
    }
    
    func getDeviceToken() -> String? {
        return defaults?.string(forKey: UserManager.KEY_DEVICE_TOKEN)
    }
}
