//
//  ProfileModel.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public struct ProfileModel {
    
    let fullName: String
    let profileImage: UIImage
    let onTouchUpInside: () -> Void
    
    public init(fullName: String, profileImage: UIImage, onTouchUpInside: @escaping () -> Void) {
        self.fullName = fullName
        self.profileImage = profileImage
        self.onTouchUpInside = onTouchUpInside
    }
}
