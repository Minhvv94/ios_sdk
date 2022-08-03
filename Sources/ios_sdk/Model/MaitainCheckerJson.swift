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
}
