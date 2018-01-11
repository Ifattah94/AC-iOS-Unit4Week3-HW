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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteView)
        favoriteView.favoritesTableView.dataSource = self
        favoriteView.favoritesTableView.delegate = self 

    }


  
}
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteView.favoritesTableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoritesTableViewCell
        return cell
    }
    
    
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
