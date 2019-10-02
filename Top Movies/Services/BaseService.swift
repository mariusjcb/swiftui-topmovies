//
//  BaseService.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation

class BaseService {
    let api: TMDBApi
    typealias QueryItems = [TMDBApi.QueryKeys: TMDBApi.QueryValues]
    
    init(api: TMDBApi) {
        self.api = api
    }
}
