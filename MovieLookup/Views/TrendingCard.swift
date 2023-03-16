//
//  TrendingCard.swift
//  MovieLookup
//
//  Created by ioannis on 13/3/23.
//

import SwiftUI

struct TredingCard:View {
    let trendingItem:Movie
    var body: some View {
        ZStack(alignment: .bottom){
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340,height: 240)

            } placeholder: {
                Rectangle().fill(Color(red:61/255,green: 61/255,blue:88/266))
                    .frame(width: 340,height: 240)

             


            }
            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red )
                }
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", trendingItem.voteAverage))
                    Spacer()
                }
                .foregroundColor(.yellow)
            }
            .padding()
            .background(Color(red:61/255,green: 61/255,blue:88/266))
        
        }
        .cornerRadius(10)
    }
}

