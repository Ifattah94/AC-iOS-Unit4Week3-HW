//
//  DetailViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

      let detailView = DetailView()
    
    
    var city: String
    //var forecast: Forecast
    var imageUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(detailView)
        detailView.dismissView.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        detailView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        detailView.favoriteButton.addTarget(self, action: #selector(saveImage), for: .touchUpInside)

    }
    
  
    init(city: String, forecast: Forecast) {
        self.city = city
        //self.forecast = forecast
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
    @objc func saveImage() {
        if FileManagerHelper.manager.addFavoritedImage(city: city, imageUrl: imageUrl, image: detailView.cityImageView.image!) {
            if FileManagerHelper.manager.saveImage(with: imageUrl, image: detailView.cityImageView.image!) {
                swapImage()
            }
        }

        
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func swapImage() {
        let animation = CABasicAnimation(keyPath: "contents")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = UIImage(named: "icons8-heart-outline-30")?.cgImage
        animation.toValue = UIImage(named: "icons8-heart-outline-30 (1)")?.cgImage
        animation.duration = 1.0
        detailView.favoriteButton.layer.add(animation, forKey: nil)
        detailView.favoriteButton.layer.contents = UIImage(named: "icons8-heart-outline-30 (1)")?.cgImage
    }
    
    
}
