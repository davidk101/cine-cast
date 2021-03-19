//
//  APIResponse.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/19/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import Foundation

struct APIResponse: Codable{
    
    let biography: String
    let birthday: String
    let imdb_id: String
    let place_of_birth: String
    
}
