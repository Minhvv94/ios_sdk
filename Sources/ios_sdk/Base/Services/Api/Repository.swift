
import Foundation
import SwiftyJSON
import RxSwift
import Alamofire

class Repository: BaseRepository {
    
    func loginFast(jwt: String, callBack: @escaping (ApiResponse<UserModel>) -> ()) -> () {
        let url = "\(URLConst.LOGIN_FAST)"
        var params = Dictionary<String, Any>.init()
        params["jwt"] = jwt
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func refreshToken(jwt: String, appInfo : AppInfo, ip: String, callBack: @escaping (ApiResponse<UserModel>) -> ())-> (){
        let url = "\(URLConst.REFRESH_TOKEN)"
        var params = Dictionary<String, Any>.init()
        params["jwt"] = jwt
        params["cid"] = appInfo.client_id
        params["client_id"] = appInfo.client_id
        params["client_secret"] = appInfo.client_secret
        params["dvId"] = appInfo.client_id
        params["os"] = appInfo.platformOS
        params["osver"] = appInfo.client_id
        params["ip"] = appInfo.client_id
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
}
