//
//  URLConst.swift
//  ITapSdkVTV
//
//  Created by Minh Vu on 30/06/2022.
//

import Foundation

enum URLConst {

    //get server time
    static let GET_SERVER_TIME = ApiConst.BASE_URL + "/authen-service/infos/getservertime"
    
    static let LOGIN_FAST = ApiConst.BASE_URL + "/authen-service/loginfast"
    
    static let REFRESH_TOKEN = ApiConst.BASE_URL + "authen-service/refreshtoken"
    
    static let PATH_GAME_CHECK_MAINTAIN = ApiConst.BASE_URL + "/sdk-api/service/app-config"
}
