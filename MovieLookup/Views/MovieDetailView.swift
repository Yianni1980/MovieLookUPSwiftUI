//
//  MovieDetailView.swift
//  MovieLookup
//
//  Created by ioannis on 16/3/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie:Movie
    let headerHeight:CGFloat = 200
    
    var body: some View {
        ZStack {
            VStack{
                AsyncImage(url: movie.backdropURL) { image in
                    
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height:headerHeight)
                } placeholder: {
                    ProgressView()
                }
                    .frame(height: 200)
            Spacer()
            }
            
            ScrollView{
                Spacer()
                    .frame(height: 200)
                Text(movie.title)

                Text(movie.overview)
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
