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
    
    // 'lazy' needed as one var initialzied with another i.e. initial value not calcualted until use
    //lazy var url = "https://api.themoviedb.org/3/person/" + id + "?api_key=" + key.apiKey + "&language=en-US"
    
    /*func getData(id: String, completion: @escaping ((_ data: String) -> Void) ){
        
        let updated_url = "https://api.themoviedb.org/3/person/" + id + "?api_key=" + key.apiKey + "&language=en-US"
        
        let task = URLSession.shared.dataTask(with: URL(string: updated_url)!, completionHandler: { (data, response, error) in
            
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
            print("step1")
            completion("hello world")
            
            
            })
            
            task.resume()
        
        completion("hi there")
    }*/
    
    func getData1(id: String){
                   
           let updated_url = "https://api.themoviedb.org/3/person/" + id + "?api_key=" + key.apiKey + "&language=en-US"
           
           let task = URLSession.shared.dataTask(with: URL(string: updated_url)!, completionHandler: { (data, response, error) in
               
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
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataToLoad"), object: [json.biography, json.birthday, json.imdb_id, json.place_of_birth])
            
               
               })
               
               task.resume()
        

           
       }
    
}



