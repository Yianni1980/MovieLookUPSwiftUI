//
//  MovieDetailView.swift
//  MovieLookup
//
//  Created by ioannis on 16/3/23.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.dismiss) var dismiss
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
                        .clipShape(RoundedRectangle(cornerRadius:15))
                } placeholder: {
                    ProgressView()
                }
                    
            Spacer()
            }
            .ignoresSafeArea()
            ScrollView{
                Spacer()
                    .frame(height: headerHeight)
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.heavy)
                Spacer()
                //rating here
                
                Text(movie.overview)
            }
            
        }
        .overlay(alignment:.topLeading) {
            Button {
                dismiss()
            }label:{
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
            }
            .padding(.leading)
        }
     
        .toolbar(.hidden,for: .navigationBar)
     

    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
