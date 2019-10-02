//
//  Genre.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
