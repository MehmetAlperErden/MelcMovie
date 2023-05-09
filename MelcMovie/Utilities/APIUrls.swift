//
//  APIUrls.swift
//  MelcMovie
//
//  Created by Alper Erden on 3.05.2023.
//

import Foundation

enum APIUrls {
    static func movies(page: Int) -> String {
        return "https://api.themoviedb.org/3/movie/popular?api_key=aa0c77e12804a33376d14593b57f3d23&language=en-US&page=\(page)"
    }
    
    static func imageUrl(posterPath: String) -> String{
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=aa0c77e12804a33376d14593b57f3d23&language=en-US"
    }
}
