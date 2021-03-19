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

    }
    
    @objc func popVC(sender: UIBarButtonItem){
        
        navigationController?.popViewController(animated: true)
    }
    
}
