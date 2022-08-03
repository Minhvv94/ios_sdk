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
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case data = "data"
        case message = "message"
        case IsSuccessed = "IsSuccessed"
        case HaveError = "HaveError"
    }
    
    init(code: Int?, data: DatMaitainChecker?, message: String?, IsSuccessed: Bool?, HaveError : Bool?) {
        self.code = code
        self.data = data
        self.message = message
        self.IsSuccessed  = IsSuccessed
        self.HaveError = HaveError
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
