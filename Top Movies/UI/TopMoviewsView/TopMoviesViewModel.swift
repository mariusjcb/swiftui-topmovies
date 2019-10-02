//
//  TopMoviesViewModel.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class TopMoviesViewModel: ObservableObject {
    let genresService: GenresService
    let moviesService: MoviesService
    
    var subscriptions = [AnyCancellable]()
    let fetchData = PassthroughSubject<MoviesService.QueryItems, Never>()
    
    @Published var searchFilter: String = ""
    @Published var genres = [Genre]()
    @Published var allMovies = [Movie]()
    @Published var filter: Int = 0 {
        didSet {
            switch filter {
            case 0:
                fetchData.send([.sortBy: .popularity])
            case 1:
                fetchData.send([.sortBy: .releaseDate])
            case 2:
                fetchData.send([.sortBy: .revenue])
            default: break
            }
        }
    }
    
    var movies: [Movie] {
        guard !self.searchFilter.isEmpty else { return allMovies }
        return allMovies.filter { a in a.title.contains(self.searchFilter) }
    }
    
    init(genresService: GenresService, moviesService: MoviesService) {
        self.genresService = genresService
        self.moviesService = moviesService
        
        let genresSubscription = self.fetchData
            .map { _ in self.genresService.requestGenres() }
            .switchToLatest()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] in self?.genres = $0 ?? [] })
           
        let topMoviesSubscription = self.fetchData
            .map { self.moviesService.requestPopularMovies(queryItems: $0) }
            .switchToLatest()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] in self?.allMovies = $0 ?? [] })
        
        subscriptions.append(genresSubscription)
        subscriptions.append(topMoviesSubscription)
        
        filter = 0
    }
}
