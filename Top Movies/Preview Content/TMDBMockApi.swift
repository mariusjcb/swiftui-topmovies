//
//  TMDBMockApi.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation
import Combine

class TMDBMockApi: TMDBApi {
    func mockDataHandler() -> [URL?: Data] {
        return [
            url(for: .movies, queryItems: [.sortBy: .popularity]): (try? encoder.encode(MockData.getPopularMoviesWrapper())) ?? Data(),
            url(for: .movies, queryItems: [.sortBy: .revenue]): (try? encoder.encode(MockData.getPopularMoviesWrapper())) ?? Data(),
            url(for: .movies, queryItems: [.sortBy: .releaseDate]): (try? encoder.encode(MockData.getPopularMoviesWrapper())) ?? Data(),
            url(for: .genres): (try? encoder.encode(MockData.getGenresWrapper())) ?? Data()
        ]
    }
    
    override init(urlBuilder: BaseApiUrlBuilder? = nil, dataTaskPublisher: TaskPublisherDataSource = SessionDataPublisher(), dateDecodingStrategy: ((CodingKey) throws -> DateFormatter?)? = nil) {
        super.init(urlBuilder: urlBuilder, dataTaskPublisher: dataTaskPublisher, dateDecodingStrategy: dateDecodingStrategy)
        self.publisher = MockSessionDataPublisher(mockDataHandler: mockDataHandler)
    }
}
