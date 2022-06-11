//
//  ImageManager.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 11/6/22.
//

import Foundation
import UIKit

enum ImageManagerErrors {
    case invalidDataPath = "Data could not be processed"
    case invalidURL = "Data is not available"
}

class ImageManager {
    
    static let current: ImageManager = {
        let shared = ImageManager()
        return shared
    }()
    
    func Load(from url: URL, completion: @escaping(Result<UIImage, String>) -> Void) {
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(ImageManagerErrors.invalidDataPath))
            }
        } else {
            completion(.failure(ImageManagerErrors.invalidURL))
        }
    }
    
}
