//
//  WeatherService.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation

class WeatherService {
    let amusementPark: AmusementPark
    
    init(amusementPark: AmusementPark) {
        self.amusementPark = amusementPark
        execute()
    }
    
    func execute() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            if Date() == Date().startOfDay {
                self.checkAttractions(currentWeatherCondition: self.getWeatherCondition())
            }
        }
        
    }
    
    func checkAttractions(currentWeatherCondition: WeatherCondition) {
        for attraction in amusementPark.attractions {
            if attraction.weatherCondition.temperature == currentWeatherCondition.temperature && attraction.weatherCondition.windSpeed == currentWeatherCondition.windSpeed && attraction.weatherCondition.precipitation == currentWeatherCondition.precipitation {
                attraction.opened = false
            }
        }
    }
    
    func getWeatherCondition()-> WeatherCondition {
//        imagine connecting to some weather API
        let weatherCondition = WeatherCondition(temperature: 20, windSpeed: 10, precipitation: true)
        return weatherCondition
    }
}

