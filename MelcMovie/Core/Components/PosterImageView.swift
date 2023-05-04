//
//  PosterImageView.swift
//  MelcMovie
//
//  Created by Alper Erden on 4.05.2023.
//

import UIKit

class PosterImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(movie: MovieResult){
        guard let url = URL(string: APIUrls.imageUrl(posterPath: movie.posterPath ?? movie._posterPath)) else {return}
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }            
            
        }
        .resume()
    }
    
}
