//
//  Network.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import Foundation
import UIKit

class Network{
    
    let key = Key()
    
    var id = ""
    
    // 'lazy' needed as one var initialzied with another i.e. initial value not calcualted until use
    lazy var url = "https://api.themoviedb.org/3/person/" + id + "?api_key=" + key.apiKey + "&language=en-US"
    
    private func getData(from url: String ){
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                return
            }
            
            
            
        })
    }
    
}
