//
//  BaseApi.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation
import Combine

class TMDBApi: BaseApi {
    private static let tmdbBaseUrl = "https://api.themoviedb.org/3/"
    
    enum ApiResource: String {
        case movies = "discover/movie"
        case genres = "genre/movie/list"
    }
    
    enum QueryKeys: String {
        case sortBy = "sort_by"
    }
    
    enum QueryValues: String {
        case popularity = "popularity.desc"
        case revenue = "revenue.desc"
        case releaseDate = "release_date.desc"
    }
    
    //MARK: - Methods
    
    init(urlBuilder: BaseApiUrlBuilder? = nil, dataTaskPublisher: TaskPublisherDataSource = SessionDataPublisher(), dateDecodingStrategy: ((CodingKey) throws -> DateFormatter?)? = nil) {
        super.init(baseUrl: Self.tmdbBaseUrl,
                   urlBuilder: urlBuilder ?? TMDBUrlBuilder(baseUrl: Self.tmdbBaseUrl),
                   dataTaskPublisher: dataTaskPublisher,
                   dateDecodingStrategy: dateDecodingStrategy)
    }
    
    func url(for resource: ApiResource, queryItems: [URLQueryItem] = []) -> URL {
        return super.url(for: resource.rawValue, queryItems: queryItems)
    }
    
    func url(for resource: ApiResource, queryItems: [QueryKeys: QueryValues]) -> URL {
        let queryItems = queryItems.map { URLQueryItem(name: $0.key.rawValue, value: $0.value.rawValue) }
        return url(for: resource, queryItems: queryItems)
    }
    
    func request<T: Decodable>(_ dataType: T.Type,
                               from resource: ApiResource,
                               queryItems: [URLQueryItem] = []) -> AnyPublisher<T, Error> {
        super.request(T.self, from: resource.rawValue, queryItems: queryItems)
    }
    
    func request<T: Decodable>(_ dataType: T.Type,
                               from resource: ApiResource,
                               queryItems: [QueryKeys: QueryValues]) -> AnyPublisher<T, Error> {
        let queryItems = queryItems.map { URLQueryItem(name: $0.key.rawValue, value: $0.value.rawValue) }
        return self.request(T.self, from: resource, queryItems: queryItems)
    }
}
