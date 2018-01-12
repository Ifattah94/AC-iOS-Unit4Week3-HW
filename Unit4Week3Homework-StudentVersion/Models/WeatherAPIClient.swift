//
//  WeatherAPIClient.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation


class WeatherAPIClient {
    private init() {}
    static let manager = WeatherAPIClient()
    private let accessID = "qjrGy6NSBoY8IOOCNaJJd"
    private let secretKey = "gs6VATMFRT0mAp2H9L13A3A2h3jzte7frnhW3xvw"
    
    
    func getForecast(with zip: String, completionHandler: @escaping ([Forecast]) -> Void,
                     errorHandler: @escaping (Error) -> Void) {
        
        let urlStr = "https://api.aerisapi.com/forecasts/\(zip)?client_id=\(accessID)&client_secret=\(secretKey)"
        guard let url = URL(string: urlStr) else {
            errorHandler(AppError.badUrl)
            return
        }
        let request = URLRequest(url: url)
        let parseDataIntoForecast: (Data) -> Void = {(data) in
            do {
                let results = try JSONDecoder().decode(ResponseWrapper.self, from: data)
                if let response = results.response.first?.periods {
                let forecast = response
                completionHandler(forecast)
                }
            }
            catch {
                errorHandler(AppError.codingError(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: parseDataIntoForecast, errorHandler: errorHandler)
        
    }

    
}
