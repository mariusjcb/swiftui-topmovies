//
//  TMDBBaseUrlBuilder.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation

class TMDBUrlBuilder: BaseApiUrlBuilder {
    private let apiKey: String = Bundle.main.object(forInfoDictionaryKey: "TMDBApiKey") as! String
    
    private enum QueryKeys: String {
        case apiKey = "api_key"
    }
    
    override func url(for resource: String, queryItems: [URLQueryItem] = []) -> URL {
        let apiKeyQueryItem = URLQueryItem(name: QueryKeys.apiKey.rawValue, value: apiKey)
        var urlComponents = URLComponents(string: baseUrl + resource)!
        
        var queryItems = queryItems
        queryItems.append(apiKeyQueryItem)
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
}
