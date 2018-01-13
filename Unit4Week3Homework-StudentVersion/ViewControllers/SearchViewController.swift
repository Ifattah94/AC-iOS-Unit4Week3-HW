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
    let cellSpacing: CGFloat = 7.0
    
    var city = "" {
        didSet {
            forecastSearchView.cityLabel.text = "Forecast for \(city)"
        }
    }
    
    var forecasts = [Forecast]() {
        didSet {
            forecastSearchView.forecastCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(forecastSearchView)
        forecastSearchView.forecastCollectionView.dataSource = self
        forecastSearchView.forecastCollectionView.delegate = self
        forecastSearchView.zipTextField.delegate = self 
        navigationItem.title = "Forecast"

   
    }
}
    extension SearchViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return forecasts.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! ForecastCollectionViewCell
             cell.backgroundColor = .red
            let thisForecast = forecasts[indexPath.row]
            cell.weatherImageView.image = (UIImage(named: thisForecast.icon))
            cell.highLabel.text = "High \(thisForecast.maxTempF)"
            cell.lowLabel.text = "Low \(thisForecast.minTempF)"
            cell.dateLabel.text = thisForecast.dateTimeISO.components(separatedBy: "T")[0]
            
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
            let detailVC = DetailViewController(city: forecastSearchView.cityLabel.text!, forecast: forecasts[indexPath.row])
            let thisForecast = forecasts[indexPath.row]
            if (collectionView.cellForItem(at: indexPath) as? ForecastCollectionViewCell) != nil {
                detailVC.modalTransitionStyle = .crossDissolve
                detailVC.modalPresentationStyle = .overCurrentContext
                present(detailVC, animated: true, completion: nil)
                detailVC.detailView.setupDetailView(with: thisForecast, city: city)
                
                let getPixabayFromOnline = {(onlinePixabay: Pixabay) in
                    detailVC.imageUrl = onlinePixabay.webURL
                    ImageAPIClient.manager.getImage(from: onlinePixabay.webURL, completionHandler: { (onlineImage: UIImage) in
                        detailVC.detailView.cityImageView.image = onlineImage
                        
                    }, errorHandler: {print($0)})
                    
                    
                }
                PixabayAPIClient.manager.getPix(named: city, completionHandler: getPixabayFromOnline, errorHandler: {print($0)})
                
                
            }
            
        }
}


extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //handling for numbers only
        let allowedCharacters = CharacterSet.decimalDigits //digits ONLY
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {return true}
        guard text.count == 5 else {return false}
        
        let getForecastFromOnline: ([Forecast]) -> Void = {onlineForecasts in
            self.forecasts = onlineForecasts
        }
        
        let cityCompletionFromZip: (String) -> Void = {onlineCityInfo in
            self.city = onlineCityInfo
            
        }
        
        ZipCodeHelper.manager.getLocationName(from: text, completionHandler: cityCompletionFromZip, errorHandler: {print($0); self.forecastSearchView.cityLabel.text = "Not a valid zip"})
        
        WeatherAPIClient.manager.getForecast(with: text, completionHandler: getForecastFromOnline, errorHandler: {print($0)})
        
        textField.resignFirstResponder()
        return true
    }
    
    
}






