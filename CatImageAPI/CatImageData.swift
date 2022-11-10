//
//  CatImageData.swift
//  CatImageAPI
//
//  Created by Admin on 10/11/2022.
//

import Foundation

struct CatImageData: Decodable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}
