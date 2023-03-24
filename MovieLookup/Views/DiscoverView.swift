//
//  ContentView.swift
//  MovieLookup
//
//  Created by ioannis on 6/3/23.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.trending.isEmpty {
                        Text("No results")
                    }else {
                        HStack{
                            Text("Trending")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal)
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack{
                                ForEach(viewModel.trending) { trendingItem in
                                    NavigationLink {
                                        MovieDetailView(movie: trendingItem)
                                    } label: {
                                        TredingCard(trendingItem: trendingItem)

                                    }
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }else {
                    LazyVStack(){
                        ForEach(viewModel.searchResults) {item in
                            HStack {
                                AsyncImage(url: item.backdropURL) { image in
                                    
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width:80,height: 120)
                                    
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80,height: 120)
                                }
                                .clipped()
                                .cornerRadius(10)
                                VStack(alignment:.leading){
                                    Text(item.title)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                
                                    HStack{
                                        Image(systemName: "hand.thumbsup.fill")
                                            .foregroundColor(.yellow)
                                        Text(String(format: "%.1f", item.voteAverage))
                                        Spacer()
                                    }
                                    .foregroundColor(.yellow)
                                    .fontWeight(.heavy)
                                    
                                }
                                
                                Spacer()

                            }
                            .padding(.horizontal)
                            .background(Color(red:61/255,green: 61/255,blue:88/266))
                            .cornerRadius(20)
                            
                            .padding(.horizontal)

                        }
                    }
                }
            }
            .background(Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea())
        }
        .onChange(of: searchText,  perform: { newValue in
            if newValue.count > 2 {
                viewModel.search(term: newValue)
            }
        })
        .searchable(text: $searchText)
        
        .onAppear {
            viewModel.loadTrending()
            
        

        }
    }
}



struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
