//
//  SearchViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let forecastSearchView = ForecastSearchView()
    let cellSpacing: CGFloat = 5.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(forecastSearchView)
        forecastSearchView.forecastCollectionView.dataSource = self
        forecastSearchView.forecastCollectionView.delegate = self 

   
    }
}
    extension SearchViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! ForecastCollectionViewCell
            cell.backgroundColor = .red
            cell.dateLabel.text = "today"
            cell.lowLabel.text = "wooo"
            return cell
        }
        
        
    }
    
    
    extension SearchViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let numCells: CGFloat = 3
            let numSpaces: CGFloat = numCells + 1
            
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            
            return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / (numCells + 0.5), height: screenHeight * 0.30)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return cellSpacing
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return cellSpacing
        }
    }

    extension SearchViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailVC = DetailViewController()
            if let cell = collectionView.cellForItem(at: indexPath) as? ForecastCollectionViewCell {
                detailVC.modalTransitionStyle = .crossDissolve
                detailVC.modalPresentationStyle = .overCurrentContext
                present(detailVC, animated: true, completion: nil)
                
                
            }
            
        }
}
