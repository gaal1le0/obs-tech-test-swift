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
    let profileImageURL: URL
    
    public init(fullName: String, profileImageURL: URL) {
        self.fullName = fullName
        self.profileImageURL = profileImageURL
    }
}
