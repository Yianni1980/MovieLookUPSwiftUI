//
//  TrendingItem.swift
//  MovieLookup
//
//  Created by ioannis on 13/3/23.
//

import Foundation
struct Movie:Identifiable,Codable {
    let adult:Bool
    let id:Int
    let posterPath:String?
    let title:String
    let overview:String
    let voteAverage:Float
    let backDropPath:String?

    
    enum CodingKeys:String,CodingKey {
        case adult,id
        case posterPath = "poster_path"
        case title,overview
        case voteAverage = "vote_average"
        case backDropPath = "backdrop_path"
    }
    
    var backdropURL:URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w300/")
        return baseURL?.appending(path: backDropPath ?? "")
    }
    
    var posterThumbnail:URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100/")
        return baseURL?.appending(path: posterPath ?? "")
    }
    
    var poster:URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w300/")
        return baseURL?.appending(path: posterPath ?? "")
    }
    
    static var preview: Movie {
        return Movie(adult: false, id: 242442, posterPath: "https://image.tmdb.org/t/p/w500/", title: "free Guy", overview: "demo demo demo demo", voteAverage: 5.5, backDropPath: "https://image.tmdb.org/t/p/w100/")
    }
    
}
