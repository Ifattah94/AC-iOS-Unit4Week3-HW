//
//  SearchPageView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit


class ForecastSearchView: UIView {
    
    //let cellSpacing = UIScreen.main.bounds.size.width * 0.013
    let cellSpacing: CGFloat = 5.0
    private let cellIdentifier = "forecastCell"
    
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "The forecast for blank"
        label.font = UIFont.systemFont(ofSize: 21, weight: .heavy)
        return label
    }()
    
    lazy var forecastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: bounds, collectionViewLayout: layout) //initializing collection view with a frame equal to its bounds
        cv.backgroundColor = .cyan
        cv.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        return cv
        
    }()
    
    lazy var zipTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .bezel
        textField.placeholder = "Enter Zipcode"
        textField.textAlignment = .center
        return textField
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
       //TODO set up each views constraints with functions
        setupCityLabel()
        setupForecastCollectionView()
        setupZipTextField()
    }
    
    private func setupCityLabel() {
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    private func setupForecastCollectionView() {
        addSubview(forecastCollectionView)
        forecastCollectionView.translatesAutoresizingMaskIntoConstraints = false
        forecastCollectionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 8).isActive = true
        forecastCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        forecastCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        forecastCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        //forecastCollectionView.delegate = self
        //forecastCollectionView.dataSource = self
    }
    
    private func setupZipTextField() {
        addSubview(zipTextField)
        zipTextField.translatesAutoresizingMaskIntoConstraints = false
        zipTextField.topAnchor.constraint(equalTo: forecastCollectionView.bottomAnchor, constant: 8).isActive = true
        zipTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        zipTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
    }
    

}







