//
//  PreviewMockGenerator.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation

class MockData {
    static let randomImageUrl = URL(string: "https://picsum.photos/400/500")!
    static let loremIpsum = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting."
    
    static let images: [URL] = [
        URL(string: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fscottmendelson%2Ffiles%2F2019%2F06%2F5cd3857276811.jpg")!,
        URL(string: "https://cnet1.cbsistatic.com/img/HI1TFJdNMU9SABqp88sPZ7x5L28=/1600x900/2019/04/25/9277c764-601d-4ab3-85f9-9c39d7f1ac5a/avengers-endgame-promo-crop.jpg")!
    ]
    
    static func getPopularMovies() -> [Movie] {
        let slice = [
                Movie(id: 0, title: "Avengers: End Game", overview: loremIpsum, poster: images[1], backdrop: images[1], votes: 10, genres: [1, 2, 3, 4]),
                Movie(id: 1, title: "La Haine", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 5, genres: [0, 2]),
                Movie(id: 3, title: "The 400 Blows", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 3.5, genres: [3, 8, 1]),
                Movie(id: 4, title: "Man Bites Dog", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 7, genres: [4, 6, 8, 9]),
                Movie(id: 5, title: "The Departed", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 1, genres: [10, 7, 3, 2]),
                Movie(id: 6, title: "Umberto D.", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 2, genres: [10, 9, 8, 4, 0]),
                Movie(id: 8, title: "White Heat", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 0, genres: [1, 10, 9, 7]),
                Movie(id: 9, title: "Eddie Murphy: Raw", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 10, genres: [5, 0, 6, 2, 3]),
                Movie(id: 10, title: "The Da Vinci Code", overview: loremIpsum, poster: randomImageUrl, backdrop: randomImageUrl, votes: 4, genres: [5, 10, 0])]
            .shuffled()
        
        var fixedPrefix = [
                Movie(id: 7, title: "X-Man: Dark Phoenix", overview: loremIpsum, poster: images[0], backdrop: images[0], votes: 8, genres: [2, 4, 7])
            ]
        fixedPrefix.append(contentsOf: Array(slice))
        
        return fixedPrefix
    }
    
    static func getGenres() -> [Genre] {
        return [Genre(id: 0, name: "Political"),
                Genre(id: 1, name: "Historical"),
                Genre(id: 2, name: "Horror"),
                Genre(id: 3, name: "Speculative"),
                Genre(id: 4, name: "Urban"),
                Genre(id: 5, name: "Action"),
                Genre(id: 6, name: "Thriller"),
                Genre(id: 7, name: "Romance"),
                Genre(id: 8, name: "Paranoid Fiction"),
                Genre(id: 9, name: "Comedy"),
                Genre(id: 10, name: "Saga")].shuffled()
    }
    
    static func getPopularMoviesWrapper() -> PopularMoviesWrapper {
        return PopularMoviesWrapper(results: getPopularMovies())
    }
    
    static func getGenresWrapper() -> GenresWrapper {
        return GenresWrapper(genres: getGenres())
    }
}
