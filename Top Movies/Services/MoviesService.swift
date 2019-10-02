//
//  MoviesApi.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation
import Combine

class MoviesService: BaseService {
    func requestPopularMovies(queryItems: QueryItems = [:]) -> AnyPublisher<[Movie]?, Never> {
        api.request(PopularMoviesWrapper.self, from: .movies, queryItems: queryItems)
            .print("test")
            .map { $0.results }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
