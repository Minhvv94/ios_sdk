//
//  File.swift
//
//
//  Created by Minh Vu on 18/07/2022.
//

import Foundation
class UserModel: Codable {
    
    let code: Int?
    let data: Datu?
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
    
    init(code: Int?, data: Datu?, message: String?, IsSuccessed: Bool?, HaveError : Bool?,
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

class Datu: Codable {
    let access_token: String?
    let expires_in: Int?
    var refresh_token: String?
    
    enum CodingKeys: String, CodingKey {
        case access_token = "access_token"
        case expires_in = "expires_in"
        case refresh_token = "refresh_token"
    }
    init(access_token: String?, expires_in: Int?, refresh_token: String?) {
        self.access_token = access_token
        self.expires_in = expires_in
        self.refresh_token = refresh_token
    }
    
    

}
