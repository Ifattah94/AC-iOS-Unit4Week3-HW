//
//  PixabayAPIClient.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
class PixabayAPIClient {
    private let key = "7289812-63a2aed251a84a396c3d3d4a9"
    private init() {}
    static let manager = PixabayAPIClient()
    func getPix(named str: String, completionHandler: @escaping (Pixabay) -> Void, errorHandler: @escaping (Error) -> Void) {
        let formattedStr = str.replacingOccurrences(of: " ", with: "-")
        let urlStr = "https://pixabay.com/api/?key=\(key)&q=\(formattedStr)&image_type=photo"
        guard let url = URL(string: urlStr) else {return}
        
        let request = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                
                let pixInfo = try JSONDecoder().decode(PixabayWrapper.self, from: data)
                if !pixInfo.hits.isEmpty {
                let numPix = pixInfo.hits.count
                let randomIndex = Int(arc4random_uniform(UInt32(numPix - 1)))
                let randPix = pixInfo.hits[randomIndex]
                completionHandler(randPix)
                } else {
                    errorHandler(AppError.badUrl)
                }
            }
            catch let error {
                print(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
        
    }
    
    
}
