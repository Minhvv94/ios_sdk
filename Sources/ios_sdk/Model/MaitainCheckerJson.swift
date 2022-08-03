//
//  MaitainCheckerJson.swift
//  
//
//  Created by Minh Vu on 03/08/2022.
//

import Foundation

class MaitainCheckerJson: Codable {
    let isMaintained: Bool?
    let messageMaintain: String?
    let enableGoogleLogin: Bool?
    let enableFacebookLogin: Bool?
    let enableAppleLogin: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case isMaintained = "isMaintained"
        case messageMaintain = "messageMaintain"
        case messenableGoogleLoginage = "messenableGoogleLoginage"
        case enableFacebookLogin = "enableFacebookLogin"
        case enableAppleLogin = "enableAppleLogin"
        
    }
    
    init(isMaintained: Bool?, messageMaintain: String?, messenableGoogleLoginage: Bool?, enableFacebookLogin: Bool?, enableAppleLogin: Bool?) {
        self.isMaintained = isMaintained
        self.messageMaintain = messageMaintain
        self.messenableGoogleLoginage = messenableGoogleLoginage
        self.enableFacebookLogin = enableFacebookLogin
        self.enableAppleLogin = enableAppleLogin
    }
}
