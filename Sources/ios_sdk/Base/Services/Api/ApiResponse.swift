

import Alamofire
import SwiftyJSON
import UIKit



class ApiResponse<T>: NSObject {
    let STATUS_SUCCESS = ApiConst.STATUS_SUCCESS
    let STATUS_ERROR = ApiConst.STATUS_ERROR

    var code: Int = 0 // code
    var message: String = ""
    var data: T?
    var rawData: String?
    var reponse: String = ""
    var IsSuccessed: Bool = true
    var HaveError: Bool = true
    var redirectUrl: String = ""
    var token_expired = ""

    init(errorMessage: String) {
        self.code = ApiConst.STATUS_ERROR
        self.message = errorMessage
    }
    
    init(data: T) {
        self.code = ApiConst.STATUS_SUCCESS
        self.data = data
    }
    
    init(rawData: String?) {
        self.code = ApiConst.STATUS_SUCCESS
        self.rawData = rawData
    }
    
    func isSuccess() -> Bool {
        return self.code == ApiConst.STATUS_SUCCESS
    }
    
    func isError() -> Bool {
        return !isSuccess()
    }
    
}
