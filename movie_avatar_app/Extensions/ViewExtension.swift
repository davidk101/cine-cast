//
//  File.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func pin(to view: UIView){
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive  = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
