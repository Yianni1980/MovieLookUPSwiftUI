//
//  MovieDbViewModel.swift
//  MovieLookup
//
//  Created by ioannis on 13/3/23.
//

import Foundation
@MainActor
class MovieDBViewModel:ObservableObject {
    
    @Published var trending:[Movie] = []
    @Published var searchResults:[Movie] = []
    let apiKey = "c12da7a0ddee2ad7151cd0e572c84195"
    //    static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMTJkYTdhMGRkZWUyYWQ3MTUxY2QwZTU3MmM4NDE5NSIsInN1YiI6IjYwN2UwMjU0YWUyODExMDA1N2U5NGVjYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6YBxs4wrKS8dO3CYQ0YOVhOjT1c_V6Gfjr6gZ1fkhM0"
    //https://api.themoviedb.org/3/trending/movie/day?api_key=c12da7a0ddee2ad7151cd0e572c84195
    
    //https://api.themoviedb.org/3/trending/all/day?api_key=c12da7a0ddee2ad7151cd0e572c84195
    
    
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(apiKey)")!
            do  {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                
                
                
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                trending = trendingResults.results
                
            } catch {
                
            }
            
            
        }
    }
    
//https://api.themoviedb.org/3/search/movie?api_key=c12da7a0ddee2ad7151cd0e572c84195&language=en-US&page=1&include_adult=false&query=top%20gun%22
    
    func search(term:String) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&page=1&include_adult=false&query=\(term)".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!

            
            do  {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                
                
                
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                searchResults = trendingResults.results
                
            } catch {
                
            }
            
            
        }
    }
}
