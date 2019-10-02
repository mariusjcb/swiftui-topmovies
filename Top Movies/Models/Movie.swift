//
//  Movie.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let poster: URL?
    let backdrop: URL?
    let votes: Double
    //let releaseDate: Date
    let genres: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case poster = "poster_path"
        case backdrop = "backdrop_path"
        case votes = "vote_average"
        //case releaseDate = "release_date"
        case genres = "genre_ids"
    }
}
