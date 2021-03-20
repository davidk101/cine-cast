//
//  Network.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import Foundation
import UIKit

struct APIResponse: Codable{
    
    let biography: String
    let birthday: String
    let imdb_id: String
    let place_of_birth: String
    
}

class NetworkCall{
    
    let key = Key()
    var output: String = ""
    
    func getData(id: String){
    
        let url = "https://api.themoviedb.org/3/person/" + id + "?api_key=" + key.apiKey + "&language=en-US"
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
               
            guard let data = data, error == nil else {
                   
                return
            }
               
            var result: APIResponse?
                
            do{
                   
                result = try JSONDecoder().decode(APIResponse.self, from: data)
            }
            catch{
                   
                return
            }
                
            guard let json = result else{
                   
                return
            }
                        
            self.output = "Birthday: " + json.birthday + "\nIMDB ID: " + json.imdb_id + "\nPlace of Birth: " + json.place_of_birth
                            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fromAPI"), object: self.output)
                        
        })
               
        task.resume()
        
        
        
    }
}



