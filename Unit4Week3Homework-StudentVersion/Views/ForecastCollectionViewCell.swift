//
//  ForecastCollectionViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "todays date"
        label.textAlignment = .center
        return label
    }()
    
    lazy var weatherImageView: UIImageView = {
       let iv = UIImageView()
       iv.contentMode = .scaleAspectFit
       iv.image = #imageLiteral(resourceName: "sunny")
       return iv
    }()
    
    lazy var highLabel: UILabel = {
        let label = UILabel()
        label.text = "High 33"
        label.textAlignment = .center
        return label
    }()
    
    lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Low 24"
        label.textAlignment = .center
        return label
    }()
    
    //stackview below for high and low labels
    lazy var labelStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [highLabel, lowLabel])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 5
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    //TODO convenience init for custom cell based on zip code to setup aproppriate image and data
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    
    
    private func setupViews() {
        setUpDateLabel()
        setupWeatherImageView()
        setupLabelStackView()
        
        
    }
    
    private func setUpDateLabel() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupWeatherImageView() {
        addSubview(weatherImageView)
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 0).isActive = true
        weatherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        weatherImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        weatherImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
    }
    private func setupLabelStackView() {
        addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 0).isActive = true
        labelStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
