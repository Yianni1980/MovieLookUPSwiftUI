//
//  MovieDbViewModel.swift
//  MovieLookup
//
//  Created by ioannis on 13/3/23.
//

import Foundation
@MainActor
class MovieDiscoverViewModel:ObservableObject {
    
    @Published var trending:[Movie] = []
    @Published var searchResults:[Movie] = []
    static let apiKey = "c12da7a0ddee2ad7151cd0e572c84195"
    
    
    
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDiscoverViewModel.apiKey)")!
            do  {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                
                
                
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                trending = trendingResults.results
                
            } catch {
                
            }
            
            
        }
    }
    
    
    func search(term:String) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDiscoverViewModel.apiKey)&language=en-US&page=1&include_adult=false&query=\(term)".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
            
            
            do  {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                
                
                
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                searchResults = trendingResults.results
                
            } catch {
                
            }
            
            
        }
    }
    
}

