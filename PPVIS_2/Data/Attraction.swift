//
//  Attraction.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation

class Attraction: Building {
    var passibility = 0
    var soldTicketsForDay = 0
    var soldTiketsForMonth = 0
    var opened = true
    var price: Double
    let rate: Double
    let workingHours: WorkingHours
    
    init(id: String, weatherCondition: WeatherCondition, price: Double, rate: Double, workingHours: WorkingHours) {
        self.price = price
        self.rate = rate
        self.workingHours = workingHours
        super.init(id: id, weatherCondition: weatherCondition)
    }
}
