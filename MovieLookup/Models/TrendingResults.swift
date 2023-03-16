//
//  TrendingResults.swift
//  MovieLookup
//
//  Created by ioannis on 13/3/23.
//

import Foundation
struct TrendingResults:Codable {
    let page:Int
    let results:[Movie]
    let totalPages:Int
    let totalResults:Int
    
    enum CodingKeys:String,CodingKey {
        case page,results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        
    }
}
