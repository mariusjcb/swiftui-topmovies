//
//  GenresApi.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation
import Combine

class GenresService: BaseService {
    func requestGenres() -> AnyPublisher<[Genre]?, Never> {
        api.request(GenresWrapper.self, from: .genres)
            .map { $0.genres }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
