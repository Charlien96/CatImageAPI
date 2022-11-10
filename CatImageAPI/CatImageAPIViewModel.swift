//
//  CatImageViewModel.swift
//  CatImageAPI
//
//  Created by Admin on 10/11/2022.
//

import Foundation

class CatImageAPIViewModel {
    
    weak var delegate: CatImageRefreshData?
    init(delegate: CatImageRefreshData) {
        self.delegate = delegate
    }
    var networkManager = NetworkManager()
    var catImage: [CatImageData] = []
    
    func getCatImage() {
        networkManager.getCatImage { [weak self] catImage in
            self?.catImage = catImage
            DispatchQueue.main.async {
                self?.delegate?.refresh()
            }
        }
    }
}
