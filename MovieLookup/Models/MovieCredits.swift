//
//  MovieCredits.swift
//  MovieLookup
//
//  Created by ioannis on 24/3/23.
//

import Foundation

struct MovieCredits:Decodable{
    let id:Int
    let cast: [Cast]
    
    
    struct  Cast:Decodable,Identifiable{
        let name:String
        let id:Int
        let character:String
        let order:Int
        
    }
    
}
