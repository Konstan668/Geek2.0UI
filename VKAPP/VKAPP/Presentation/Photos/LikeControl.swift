//
//  LikeControl.swift
//  VKAPP
//
//  Created by Konstantin on 12.09.2021.
//

import UIKit

class LikeControl: UIControl {
    
    
    var isFavorite: Bool = false {
        didSet {
            sendActions(for: .valueChanged)
            updateControl()
        }
    }
    
    private var likeLabel: UILabel = {
        let likelabel = UILabel()
        likelabel.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        likelabel.translatesAutoresizingMaskIntoConstraints = false
        likelabel.text = ""
        return likelabel
    }()
    
    private var likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 30, y: 0, width: 30, height: 30)
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.image = UIImage(named: "Heart")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupGsture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupGsture()
    }
    private func updateControl() {
        if isFavorite {
            likeImage.image = UIImage(named: "HeartFill")
            
            
        } else {
            likeImage.image = UIImage(named: "Heart")
        }
    }
    
    private func setupViews() {
        addSubview(likeImage)
        addSubview(likeLabel)
        NSLayoutConstraint.activate([
            //            likeImage.topAnchor.constraint(equalTo: topAnchor),
            //            likeImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            //            likeImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            //            likeImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            likeLabel.topAnchor.constraint(equalTo: topAnchor),
            likeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            likeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            likeLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    private func setupGsture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tap)
        
    }
    @objc private func tapped(){
        isFavorite.toggle()
        
        if isFavorite == false {
            likeLabel.text = ""
            
        } else {
            likeLabel.text = "1"
        }
    }
}
