//
//  FriendsTableViewCell.swift
//  VKAPP
//
//  Created by Konstantin on 26.08.2021.
//

import UIKit

final class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendsImage: UIImageView!
    @IBOutlet weak var friendsLabel: UILabel!
    
    static let identifier = "FriendsTableViewCell"
    
    func configure (user: User) {
        friendsImage.image = UIImage(named: user.userImageName)
        friendsLabel.text = user.userName
    }
    
    
}
