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
    
    @objc func buttonPressed() {
        print("Button PPPPPP")
        animateFindGroupsImage()
//        UIView.animate(withDuration: 1) {
//            let newBounds:CGRect = CGRect(x: self.findGroupsImage.bounds.maxX + 50, y: self.findGroupsImage.bounds.maxY + 50, width: self.findGroupsImage.bounds.width + 50, height: self.findGroupsImage.bounds.height + 50)
//
//
//
//            self.findGroupsImage.bounds = newBounds
//        }
    }
    

    
    
    func addImageButton()-> UIButton {
        let imageButton: UIButton  = {
            let button = UIButton(frame: findGroupsImage.frame )
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            return button
        } ()
        return imageButton
    }
    
    func animateFindGroupsImage() {
            let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.7
        animation.toValue = 1
            animation.stiffness = 500
            animation.mass = 1
            animation.duration = 2
            animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
            self.findGroupsImage.layer.add(animation, forKey: nil)
        }
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
