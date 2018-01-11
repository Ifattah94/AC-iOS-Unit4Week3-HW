//
//  DetailView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class DetailView: UIView {

    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var dismissView: UIButton = {
        let button = UIButton(frame: UIScreen.main.bounds)
        button.backgroundColor = .clear
        return button
    }()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icons8-heart-outline-30"), for: .normal)
        return button
    }()
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Temp"
        
        return label
    }()
    
  
    
    
    
    lazy var cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "monkey")
        return imageView
    }()
    
  
    
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        
        return label
    }()
    
    lazy var highLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        
        return label
    }()
    
    lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        
        return label
    }()
    
    lazy var windspeedLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        
        return label
    }()
    
    lazy var percipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [conditionLabel, highLabel, lowLabel, sunriseLabel, sunsetLabel, windspeedLabel, percipitationLabel])
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.alignment = UIStackViewAlignment.center
        
        stackView.spacing = 3.0
        
        return stackView
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
    
    override func layoutSubviews() {
        //get the size of the elements
        super.layoutSubviews()
        cityImageView.layer.cornerRadius = cityImageView.bounds.width/2.0
        cityImageView.layer.masksToBounds = true
       
    }
    
    
    private func setupViews() {
        setupBlurEffectView()
        setupDismissView()
        setupContainterView()
        setupFavoriteButton()
        setupTitleLabel()
        setupCityImageView()
        setupStackView()
    }
    
    private func setupBlurEffectView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark) // .light, .dark, .prominent, .regular, .extraLight
        let visualEffect = UIVisualEffectView(frame: UIScreen.main.bounds) //our visual effect will consist of the entire screen
        visualEffect.effect = blurEffect //give the visual effect our blur effect
        addSubview(visualEffect)
    }
    
    
    private func setupStackView() {
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: cityImageView.bottomAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        
        
    }
    
    private func setupDismissView() {
        addSubview(dismissView)
    }
    
    
    private func setupTitleLabel() {
        addSubview(topLabel)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        topLabel.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 8).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        
    }
    private func setupCityImageView() {
        addSubview(cityImageView)
        
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        cityImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 8).isActive = true
        cityImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cityImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.80).isActive = true
        cityImageView.heightAnchor.constraint(equalTo: cityImageView.widthAnchor).isActive = true
        
        
    }
    
    private func setupFavoriteButton() {
        addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    
    private func setupContainterView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        
    }
    
}
    
    


