//
//  FavoritesViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let favoriteView = FavoritesView()
    
    var favoriteImages = [FileManagerHelper.FavoriteImage]() {
        didSet {
            favoriteView.favoritesTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        FileManagerHelper.manager.loadFavoriteImages()
        favoriteImages = FileManagerHelper.manager.getFavoritedImages()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteView)
        FileManagerHelper.manager.loadFavoriteImages()
        favoriteView.favoritesTableView.dataSource = self
        favoriteView.favoritesTableView.delegate = self

    }


  
}
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteView.favoritesTableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoritesTableViewCell
        let favoriteImage = favoriteImages[indexPath.row]
        ImageAPIClient.manager.getImage(from: favoriteImage.url, completionHandler: { cell.cityImageView.image = $0 }, errorHandler: { print($0) })
        return cell
    }
    
    
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

