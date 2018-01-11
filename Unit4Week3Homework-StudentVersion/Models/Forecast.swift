//
//  Forecast.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
struct ResponseWrapper: Codable {
    let response: [Response]
}

struct Response: Codable {
    let periods: [Forecast]
}

struct Forecast: Codable {
    let timestamp: Int
    let validTime: String
    let dateTimeISO: String
    let maxTempC: Int
    let maxTempF: Int
    let minTempC: Int
    let minTempF: Int
    let avgTempC: Int
    let avgTempF: Int
    let precipMM: Double
    let precipIN: Double
    let snowCM: Double
    let snowIN: Double
    let feelslikeC: Int
    let feelslikeF: Int
    let minFeelslikeC: Int
    let minFeelslikeF: Int
    let maxFeelslikeC: Int
    let maxFeelslikeF: Int
    let avgFeelslikeC: Int
    let avgFeelslikeF: Int
    let windSpeedKTS: Int
    let windSpeedKPH: Int
    let windSpeedMPH: Int
    let weather: String
    let weatherPrimary: String
    var icon: String
    let sunrise: Int
    let sunriseISO: String
    let sunset: Int
    let sunsetISO: String
}
