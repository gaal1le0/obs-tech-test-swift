//
//  UIImage+Extension.swift
//  
//
//  Created by Emanuel Martinez on 12/6/22.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, completion: @escaping() -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                self.image = UIImage(named: "default_image")
                return
            }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
                completion()
            }
        }.resume()
    }
}
