//
//  FindGroupTableViewCell.swift
//  VKAPP
//
//  Created by Konstantin on 01.09.2021.
//

import UIKit

class FindGroupTableViewCell: UITableViewCell {
    
    static let identifier = "findGroupTableViewCell"
    
    @IBOutlet weak var findGroupsLabel: UILabel!
    @IBOutlet weak var findGroupsImage: UIImageView!
    
    func configure(group: Group) {
        findGroupsLabel.text = group.groupName
        findGroupsImage.image = UIImage(named: group.groupImage)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
