//
//  Movie.swift
//  MelcMovie
//
//  Created by Alper Erden on 3.05.2023.
//

import Foundation

struct Movie: Decodable {
    let results: [MovieResult]?
    
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    var _posterPath: String {
        posterPath ?? ""
    }
}
