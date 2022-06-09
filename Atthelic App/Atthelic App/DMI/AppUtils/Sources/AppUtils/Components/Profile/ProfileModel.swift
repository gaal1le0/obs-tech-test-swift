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
    
    public init(fullName: String, profileImage: UIImage) {
        self.fullName = fullName
        self.profileImage = profileImage
    }
}
