//
//  UIImage.swift
//  
//
//  Created by Minh Vu on 09/08/2022.
//

import Foundation
import UIKit
extension UIImage {
    
    func getImageModel(imageName: String) -> UIImageView? {
        let image = UIImage(named: imageName, in: Bundle.module, compatibleWith: nil)
        return UIImageView(image: image!)
    }
}
