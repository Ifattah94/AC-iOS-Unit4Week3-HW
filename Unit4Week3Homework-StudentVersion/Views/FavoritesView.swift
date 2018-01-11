//
//  FavoritesView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    lazy var favoritesTableView: UITableView = {
        let tv = UITableView()
        tv.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "FavoriteCell")
        tv.backgroundColor = .orange 
        //tv.dataSource = self 
        
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
        
    }
    
    private func setupViews() {
        setupFavoritesTableView()
    }
    
    func setupFavoritesTableView() {
        addSubview(favoritesTableView)
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        let guide = safeAreaLayoutGuide
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        favoritesTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        favoritesTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        favoritesTableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        favoritesTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    

}







