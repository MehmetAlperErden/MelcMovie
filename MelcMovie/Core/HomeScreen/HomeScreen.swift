//
//  HomeScreen.swift
//  MelcMovie
//
//  Created by Alper Erden on 3.05.2023.
//

import UIKit
import SnapKit

protocol HomeScreenInterface: AnyObject {
    func configureVC()
    func configureCollectionView()
}

final class HomeScreen: UIViewController {
    private let viewModel = HomeViewModel()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
        
        
    }
}

extension HomeScreen: HomeScreenInterface {
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UIHelper.createHomeFlowLayout())
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
    }
    
    
    
    func configureVC() {
        view.backgroundColor = .red
    }
}

extension HomeScreen: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        
        return cell
    }
    
    
}
