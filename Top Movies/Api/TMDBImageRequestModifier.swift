//
//  TMDBImageRequestModifier.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation
import Kingfisher

typealias ImageRequestModifier = ImageDownloadRequestModifier
class TMDBImageRequestModifier: ImageDownloadRequestModifier {
    let baseUrl = URL(string: "https://image.tmdb.org/t/p/original/")!

    func modified(for request: URLRequest) -> URLRequest? {
        var request = request
        
        if request.url?.host == nil {
            request.url = baseUrl.appendingPathComponent(request.url?.path ?? "")
        }
        
        return request
    }
}
