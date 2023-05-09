//
//  UICollectionView+Ext.swift
//  MelcMovie
//
//  Created by Alper Erden on 8.05.2023.
//

import UIKit

extension UICollectionView{
    
    func reloadMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
}
