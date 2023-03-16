//
//  MovieLookupApp.swift
//  MovieLookup
//
//  Created by ioannis on 6/3/23.
//

import SwiftUI

@main
struct MovieLookupApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "popcorn")
                    }
                Text("Favs")
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                Text("Tickets")
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                    }
            }
        }
    }
}
