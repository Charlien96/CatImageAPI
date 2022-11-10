//
//  NetworkManager.swift
//  CatImageAPI
//
//  Created by Admin on 10/11/2022.
//

import Foundation

class NetworkManager {
    
    func getCatImages(completionHandler:@escaping ([CatImageData])-> Void) {
        let session = URLSession.shared
        let urlString = "https://api.opendota.com/api/heroStats"
        guard let url = URL(string: urlString) else {return}
        
        let dataTask = session.dataTask(with: url) {data, response, error in
            guard let data = data else {
                return
            }
            let decoded = JSONDecoder()
            do {
                let decodedResponse = try decoded.decode([CatImageData].self, from: data)
                 completionHandler(decodedResponse)
            }
            catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
