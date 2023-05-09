//
//  MovieService.swift
//  MelcMovie
//
//  Created by Alper Erden on 3.05.2023.
//

import Foundation

class MovieService {
    func downloadUrl(page: Int,completion: @escaping ([MovieResult]?) -> (())){
        guard let url = URL(string: APIUrls.movies(page: page)) else {return}
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            guard let self = self else {return}
            switch result {
            case .success(let data):
                completion(self.handleWithdata(data))
            case .failure(let error):
                self.handleWithError(error: error)
            }
        }
        
    }
    
    func downloadDetail(id: Int, completion: @escaping (MovieResult?) -> ()){
        guard let url = URL(string: APIUrls.detail(id: id)) else {return}
        
        NetworkManager.shared.download(url: url) { [weak self] result  in
            switch result {
            case .success(let data):
                self?.handleWithdata(data)
            case .failure(let error):
                self?.handleWithError(error: error)
            }
        }
    }
    private func handleWithError(error: Error){
        print(error.localizedDescription)
        }
    
    private func handleWithdata(_ data: Data) -> [MovieResult]?{
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
             return movie.results
            
        }catch {
            print(error)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> MovieResult? {
        do {
            let movieDetail = try JSONDecoder().decode(MovieResult.self, from: data)
            return movieDetail
        } catch {
            print(error)
            return nil
        }
    }
    
}

