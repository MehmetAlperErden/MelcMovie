//
//  DetailScreen.swift
//  MelcMovie
//
//  Created by Alper Erden on 9.05.2023.
//


import UIKit

protocol DetailScreenInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()
}

final class DetailScreen: UIViewController {
    
    private let movie: MovieResult
    private let viewModel = DetailViewModel()
    
    private let padding: CGFloat = 16
    
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension DetailScreen: DetailScreenInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        posterImageView.backgroundColor = .red
        view.addSubview(posterImageView)
        
        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
        
        posterImageView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(250)
            make.width.equalTo(120)
        }
    }
    
    func downloadPosterImage() {
        posterImageView.downloadImage(movie: movie)
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 2
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(posterImageView.snp.right).offset(24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie._releaseDate
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel
        
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom).offset(24)
            make.centerX.equalTo(titleLabel.snp.centerX)
        }
    }
    
    func configureOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        overviewLabel.text = movie._overview
        overviewLabel.font = .systemFont(ofSize: 20)
        overviewLabel.numberOfLines = 0
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
        }
    }
    
}



//import UIKit
//
//protocol DetailScreenInterface: AnyObject {
//    func configureVC()
//    func configurePosterImageView()
//}
//
//final class DetailScreen: UIViewController {
//
//    private let movie: MovieResult
//    private let viewModel = DetailViewModel()
//
//    private var posterImageView: PosterImageView!
//
//    init(movie: MovieResult) {
//        self.movie = movie
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        viewModel.view = self
//        view.backgroundColor = .white
//        print(movie.title ?? "")
//    }
//}
//
//extension DetailScreen: DetailScreenInterface {
//    func configureVC() {
//        viewModel.view = self
//        view.backgroundColor = .white
//        print(movie.title ?? "")
//    }
//    func configurePosterImageView() {
//        posterImageView = PosterImageView(frame: .zero)
//        posterImageView.backgroundColor = .red
//        view.addSubview(posterImageView)
//
//        posterImageView.layer.cornerRadius = 16
//        posterImageView.clipsToBounds = true
//
//        posterImageView.snp.makeConstraints { make in
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.height.equalTo(200)
//            make.width.equalTo(100)
//        }
//
//    }
//
//}
