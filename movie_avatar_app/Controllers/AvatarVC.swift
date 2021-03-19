//
//  AvatarVC.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import UIKit

class AvatarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(popVC(sender:)))
                
        view.backgroundColor = UIColor(red: 250/255.0, green: 177/255.0, blue: 160/255.0, alpha: 1.0)
        
        view.addSubview(imageView)
        imageConstraints()

    }
    
    @objc func popVC(sender: UIBarButtonItem){
        
        navigationController?.popViewController(animated: true)
    }
    
    let imageView: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "phillipa")
        return image
        
    }() // result of closure into imageView
    
    func imageConstraints(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
    }
    
}
