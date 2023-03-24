//
//  CastProfile.swift
//  MovieLookup
//
//  Created by ioannis on 24/3/23.
//

import Foundation
struct CastProfile:Decodable,Identifiable{
    
    let birthday:String?
    let id:Int
    let name:String
    let profilePath:String
    
    
    enum CodingKeys:String,CodingKey {
        case birthday,id,name
        case profilePath = "profile_path"
    }
    
    var photoURL:URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200/")
        return baseURL?.appending(path: profilePath ?? "")
    }
 
}
