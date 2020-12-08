//
//  WeatherCondition.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation

class WeatherCondition {
    let temperature: Int
    let windSpeed: Double
    let precipitation: Bool
    
    init(temperature: Int, windSpeed: Double, precipitation: Bool) {
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.precipitation = precipitation
    }
}
