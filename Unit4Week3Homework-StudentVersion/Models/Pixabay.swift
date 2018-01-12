//
//  Pixabay.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
struct PixabayWrapper: Codable {
    let totalHits: Int
    let hits: [Pixabay]
}
struct Pixabay: Codable {
    let previewURL: String
    let webURL: String
    let id: Double
    enum CodingKeys: String, CodingKey {
        case previewURL
        case webURL = "webformatURL"
        case id
    }
}

