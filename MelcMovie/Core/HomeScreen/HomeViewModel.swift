//
//  HomeViewModel.swift
//  MelcMovie
//
//  Created by Alper Erden on 3.05.2023.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeScreenInterface? { get set }
    func viewDidLoad()
    func getMovies()
    
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?
    private let service = MovieService()
    var movies: [MovieResult] = []
    
    
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        print("alper ulaştı ve anladı")
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
        
        
    }
    
    func getMovies() {
        service.downloadUrl { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
            
            self.movies = returnedMovies
            print(returnedMovies)
        }
    }
}
