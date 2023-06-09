//
//  MovieDetailView.swift
//  MovieLookup
//
//  Created by ioannis on 16/3/23.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    let movie:Movie
    let headerHeight:CGFloat = 400
    
    var body: some View {
        ZStack {
            Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea()
            GeometryReader { geo in
                
                VStack{
                    AsyncImage(url: movie.backdropURL) { image in
                        
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius:15))
                            .frame(maxWidth: geo.size.width, maxHeight:headerHeight)
                           
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                
            }
           
            ScrollView{
                VStack (spacing:20){
                    Spacer()
                        .frame(height: headerHeight)
                    HStack{
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.heavy)
                        Spacer()
                        //rating here
                    }
                    HStack {
                        //genre taga
                        
                        
                        
                    }
                    HStack {
                        Text("About film")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    Text(movie.overview)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Cast & Crew")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack{
                            ForEach(model.castProfiles ) {  cast in
                                CastView(cast: cast)
                            }
                        }
                    }
                }
                .padding()
            }
            
        }
        .ignoresSafeArea()

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
        .task {
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
        }
        
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}



