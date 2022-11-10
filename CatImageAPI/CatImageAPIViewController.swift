//
//  ViewController.swift
//  CatImageAPI
//
//  Created by Admin on 09/11/2022.
//

import UIKit

class CatImageAPIViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var catImageCollectionView: UICollectionView!
    var catImageAPIViewModel: CatImageAPIViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catImageCollectionView.dataSource = self
        catImageCollectionView.delegate = self
        catImageAPIViewModel = CatImageAPIViewModel(delegate: self)
        catImageAPIViewModel.getCatImage()
    }
    @IBAction func getNewCatImage(_ sender: Any) {
        catImageAPIViewModel.getCatImage()
    }
    
}

extension CatImageAPIViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catImageAPIViewModel.catImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = catImageCollectionView.dequeueReusableCell(withReuseIdentifier: "catImageCell", for: indexPath) as! CatImageAPICell
        let catImage = catImageAPIViewModel.catImage[indexPath.row]
        let imageReturned = catImage.url
        cell.catImageView.downloadImage(owner: imageReturned)
        return cell
    }
    
}

protocol CatImageRefreshData: AnyObject {
    func refresh()
}

extension CatImageAPIViewController: CatImageRefreshData {
    func refresh() {
        DispatchQueue.main.async {
            self.catImageCollectionView.reloadData()
        }
    }
}
