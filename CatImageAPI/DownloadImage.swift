//
//  DownloadImage.swift
//  CatImageAPI
//
//  Created by Admin on 10/11/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(owner: String) {
        guard let url = URL(string: owner) else
        {return}
        
        let urlSession = URLSession.shared
        
        let datatTask = urlSession.dataTask(with: url) {
            data, responce, error in
            
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        datatTask.resume()
    }
}
