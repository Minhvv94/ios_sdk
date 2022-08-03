//
//  MaitainCheckerJson.swift
//  
//
//  Created by Minh Vu on 03/08/2022.
//

import Foundation
class MaitainCheckerJson: Codable {
    
    let code: Int?
    let data: DatMaitainChecker?
    let message: String?
    let IsSuccessed : Bool?
    let HaveError: Bool?
    let redirectUrl: String?
    let token_expired: Bool?
    
    enum CodingKeys: String, CodingKey {
        case code = "status"
        case data = "data"
        case message = "message"
        case IsSuccessed = "IsSuccessed"
        case HaveError = "HaveError"
        case redirectUrl = "redirectUrl"
        case token_expired = "token_expired"
    }
    
    init(code: Int?, data: DatMaitainChecker?, message: String?, IsSuccessed: Bool?, HaveError : Bool?,
         redirectUrl: String?, token_expired: Bool?) {
        self.code = code
        self.data = data
        self.message = message
        self.IsSuccessed  = IsSuccessed
        self.HaveError = HaveError
        self.redirectUrl = redirectUrl
        self.token_expired = token_expired
    }
}


class DatMaitainChecker: Codable {
    let isMaintained: Bool?
    let messageMaintain: String?
    let enableGoogleLogin: Bool?
    let enableFacebookLogin: Bool?
    let enableAppleLogin: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case isMaintained = "isMaintained"
        case messageMaintain = "messageMaintain"
        case enableGoogleLogin = "enableGoogleLogin"
        case enableFacebookLogin = "enableFacebookLogin"
        case enableAppleLogin = "enableAppleLogin"
        
    }
    
    init(isMaintained: Bool?, messageMaintain: String?, enableGoogleLogin: Bool?, enableFacebookLogin: Bool?, enableAppleLogin: Bool?) {
        self.isMaintained = isMaintained
        self.messageMaintain = messageMaintain
        self.enableGoogleLogin = enableGoogleLogin
        self.enableFacebookLogin = enableFacebookLogin
        self.enableAppleLogin = enableAppleLogin
    }
}
