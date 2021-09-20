//
//  PhotosViewController.swift
//  VKAPP
//
//  Created by Konstantin on 25.08.2021.
//

import UIKit

class PhotosViewController: UIViewController {
    
    
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var users = User(userName: "", userImageName: "", userPhotossName: [""])
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return users.userPhothosName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as!PhotosCollectionViewCell
        cell.photoImage.image = UIImage(named: users.userPhothosName[indexPath.row])
        cell.photoImage.contentMode = .scaleAspectFill
        
        return cell
    }
    
    
}
