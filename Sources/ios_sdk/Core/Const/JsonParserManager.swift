//
//  JsonParserManager.swift
//  ITapSdkVTVLive
//
//  Created by Minh Vu on 02/07/2022.
//

import Foundation


class JsonParserManager {
    static func getUserLogin(jsonString: String) -> UserModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(UserModel.self, from: jsonData)
            return data;
        }
        return nil
    }

}
