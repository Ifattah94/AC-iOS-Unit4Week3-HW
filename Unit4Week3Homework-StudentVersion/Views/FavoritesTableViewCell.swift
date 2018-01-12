//
//  FavoritesTableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    
    lazy var cityImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = nil
        return iv
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FavoriteCell")
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
    
    func setupCityImageView(){
        addSubview(cityImageView)
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        cityImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cityImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        cityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cityImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func setupViews() {
        setupCityImageView()
    }

}
