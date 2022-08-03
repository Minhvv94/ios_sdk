//
//  OtherRepository.swift
//  ITapSdkVTVLive
//
//  Created by Minh Vu on 30/06/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

class TimeServerRepository {
    
    
    func getServerTime(callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
            let url = "\(URLConst.GET_SERVER_TIME)"
        let params = Dictionary<String, Any>.init()
        return callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getGameCheckMaintain(request_app_package: String, request_channel: String , request_version: String,
                           callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.PATH_GAME_CHECK_MAINTAIN)"
        var params = Dictionary<String, Any>.init()
        params["appPackage"] = request_app_package
        params["version"] = request_channel
        params["platform"] = request_version
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    
    let ERROR_NETWORK_MESSAGE = "Có lỗi xảy ra trong quá trình kết nối đến máy chủ."
    let ERROR_DATA_MESSAGE = "Có lỗi trong quá trình xử lý dữ liệu."
    
    func callPostMethod<T>(url: String, parameters: Dictionary<String, Any>, onComplete: @escaping (ApiResponse<T>) -> ()) {
        callApi(url: url, method: "POST", parameters: parameters, onComplete: onComplete)
    }
    
    func callGetMethod<T>(url: String, parameters: Dictionary<String, Any>, onComplete: @escaping (ApiResponse<T>) -> ()) {
        callApi(url: url, method: "GET", parameters: parameters, onComplete: onComplete)
    }
    
    
    func callGetMethod<T>(url: String, onComplete: @escaping (ApiResponse<T>) -> ()) {
        return callApi(url: url, method: "GET", parameters: [String: Any](), onComplete: onComplete)
    }
    
    func callGetMethod<T>(url: String) -> Observable<ApiResponse<T>> {
        return callApi(url: url, method: "GET", parameters: [String: Any]())
    }
    
    func callPostMethod<T>(url: String, parameters: Dictionary<String, Any>) -> Observable<ApiResponse<T>> {
        return callApi(url: url, method: "POST", parameters: parameters)
    }
    
    func callGetMethod<T>(url: String, parameters: Dictionary<String, Any>) -> Observable<ApiResponse<T>> {
        return callApi(url: url, method: "GET", parameters: parameters)
    }
    
    func callApi<T>(url: String, method: String, parameters: Dictionary<String, Any>, onComplete: @escaping (ApiResponse<T>) -> ()) {
        self.callApiCore(onComplete: onComplete, emitter: nil, url: url, method: method, parameters: parameters)
    }
    
    func callApi<T>(url: String, method: String, parameters: Dictionary<String, Any>) -> Observable<ApiResponse<T>> {
        return Observable<ApiResponse<T>>.create { (emitter) -> Disposable in
            self.callApiCore(onComplete: nil, emitter: emitter, url: url, method: method, parameters: parameters)
            return Disposables.create()
        }
    }
    
    func callApiCore<T>(onComplete: ((ApiResponse<T>) -> ())?, emitter: (AnyObserver<ApiResponse<T>>)?, url: String, method: String, parameters: Dictionary<String, Any>) {
        var httpMethod: HTTPMethod = .get
        
        if (method == "GET") {
            httpMethod = .get
        } else if (method == "POST") {
            httpMethod = .post
        }
        
        var header: HTTPHeaders?
        AF.request(url, method: httpMethod, parameters: parameters, headers: header).responseJSON(completionHandler: {response in
            switch response.result {
            case .success(let data):
                let rawData: String = JSON(data).rawString()!
                let apiResponse: ApiResponse<T> = ApiResponse(rawData: rawData)
                apiResponse.message =  ""
                emitter?.onNext(apiResponse)
                onComplete?(apiResponse)
                break
            case .failure(let error):
                print(error.localizedDescription)
                emitter?.onNext(ApiResponse(errorMessage: self.ERROR_NETWORK_MESSAGE))
                onComplete?(ApiResponse(errorMessage: self.ERROR_NETWORK_MESSAGE))
            }

        })
    }
}
