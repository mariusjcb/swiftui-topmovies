//
//  GenreMoviesList.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct GenreMoviesList: View {
    var genre: Genre
    var movies: [Movie]
    
    @State var isCollapsed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            GenreListHeader(isCollapsed: $isCollapsed, title: genre.name, count: movies.count)
                .padding(.leading, 45)
                .padding(.trailing, 30)
            
            if !isCollapsed && movies.count != 0 {
                MoviesList(movies: movies, isCollapsed: $isCollapsed)
                    .transition(.movieElementTransition)
            }
        }.padding(.bottom, isCollapsed ? 0 : -30)
    }
}

struct MoviesList: View {
    var movies: [Movie]
    
    @Binding var isCollapsed: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(movies, id: \.id) {
                    MovieView(movie: $0)
                        .frame(width: 150, height: 220)
                        .padding(.horizontal, 5)
                }
            }.padding(.horizontal, 30)
            .animation(.slideInOut(for: !isCollapsed))
            
            Spacer()
        }.frame(height: 270)
    }
}

struct GenreListHeader: View {
    @Binding var isCollapsed: Bool
    let title: String
    let count: Int
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isCollapsed.toggle()
            }
        }) {
            HStack {
                Text(title + " (\(count))")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                
                if count > 0 {
                    Image(systemName: "chevron.up.circle")
                    .colorMultiply(Color.black)
                    .rotationEffect(.degrees(isCollapsed ? 180 : 0))
                    .animation(.spring(response: 0.55, dampingFraction: 0.45, blendDuration: 0))
                }
            }
        }
    }
}

struct GenreMoviesList_Previews: PreviewProvider {
    static var previews: some View {
        GenreMoviesList(genre: MockData.getGenres().first!,
                        movies: MockData.getPopularMovies().filter { $0.genres.contains(0) })
            .previewLayout(.fixed(width: 600, height: 500))
    }
}
