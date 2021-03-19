//
//  AvatarCell.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import UIKit

class AvatarCell: UITableViewCell {
    
    var AvatarImageView = UIImageView()
    
    var AvatarTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(AvatarImageView)
        addSubview(AvatarTitleLabel)
        
        configImageView()
        configTitleLabel()
        setImageConstraints()
        setTitleConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder) has no implementation")
    }
    
    func identifyCell(avatar: Avatar){
        
        AvatarImageView.image = avatar.image
        AvatarTitleLabel.text = avatar.label
        
    }
    
    func configImageView(){
        
        AvatarImageView.layer.cornerRadius = 10
        AvatarImageView.clipsToBounds = true
        
    }
    
    func configTitleLabel(){
        
        AvatarTitleLabel.numberOfLines = 0 // word wrap
        AvatarTitleLabel.adjustsFontSizeToFitWidth = true
        AvatarTitleLabel.font = UIFont(name: "Avenir", size: 25)
        
    }
    
    func setImageConstraints(){
        
        AvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        AvatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        AvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant : 12).isActive = true
        AvatarImageView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        AvatarImageView.widthAnchor.constraint(equalTo: AvatarImageView.heightAnchor, multiplier: 1.1).isActive = true
        
    }
    
    func setTitleConstraints(){
        
        AvatarTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        AvatarTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        AvatarTitleLabel.leadingAnchor.constraint(equalTo: AvatarImageView.trailingAnchor, constant: 50).isActive = true
        AvatarTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        AvatarTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        
    }
}
