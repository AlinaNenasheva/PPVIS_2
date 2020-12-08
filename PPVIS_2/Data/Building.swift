//
//  Building.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation

class Building {
    var id: String
    let weatherCondition: WeatherCondition
    
    init(id: String, weatherCondition: WeatherCondition) {
        self.id = id
        self.weatherCondition = weatherCondition
    }
}
