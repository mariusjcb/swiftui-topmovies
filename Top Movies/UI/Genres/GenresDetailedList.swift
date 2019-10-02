//
//  GenresDetailedList.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct GenresDetailedList: View {
    let genres: [Genre]
    let movies: [Movie]
    
    var body: some View {
        VStack {
            if movies.count == 0 {
                Text("No data found")
                    .font(.title)
            }
            
            ForEach(genres, id: \.id) { genre in
                GenreMoviesList(genre: genre, movies: self.movies.filter { $0.genres.contains(genre.id) })
            }
        }
    }
}

struct GenresDetailedList_Previews: PreviewProvider {
    static var previews: some View {
        GenresDetailedList(genres: MockData.getGenres(),
                           movies: MockData.getPopularMovies())
    }
}
