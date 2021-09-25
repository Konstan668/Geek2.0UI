//
//  PhotosCollectionViewCell.swift
//  VKAPP
//
//  Created by Konstantin on 31.08.2021.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    
    
 
    @IBOutlet weak var photoImage: UIImageView!
    
    static let identifier = "photoCell"
    
    let LLikeControl: LikeControl = {
        let likeK = LikeControl()
        likeK.frame = CGRect(x: 0, y: 0, width: 60, height: 35)
        


      //  likeK.likeImage.image = UIImage(named: "MDKLOGO")
        
        return likeK
    }()
    func ss(l: LikeControl) {
        l.translatesAutoresizingMaskIntoConstraints = false
        let likeControlWidthConstaint = NSLayoutConstraint(item: l, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let likeControlHightConstaint = NSLayoutConstraint(item: l, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 35)
        let ddd = NSLayoutConstraint(item: l, attribute: .bottom, relatedBy: .equal, toItem: self.photoImage, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([likeControlWidthConstaint, likeControlHightConstaint, ddd])

    }
}

