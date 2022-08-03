//
//  AppInfoDefault.swift
//  
//
//  Created by Minh Vu on 03/08/2022.
//

import Foundation

class AppInfoDefault : Codable {
    
    func updateData(model: UpdateProfile?) {
        UserDefaults.standard.save(customObject: model, inKey: "YourKey")
    }
}
