//
//  MovieCell.swift
//  MelcMovie
//
//  Created by Alper Erden on 4.05.2023.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView!
    override init(frame: CGRect){
        super .init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelDownloading()
    }
    
    private func configureCell(){
        backgroundColor = .orange
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    func setCell(movie: MovieResult){
        posterImageView.downloadImage(movie: movie)
    }
    
    private func configurePosterImageView(){
        posterImageView = PosterImageView(frame: .zero)
        posterImageView.backgroundColor = .red
        addSubview(posterImageView)
        
        posterImageView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
    }
}
