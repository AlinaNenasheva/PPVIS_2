//
//  ParkStatisticGetter.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 6.12.20.
//

import Foundation

class ParkStatisticGetter {
    let amusementPark: AmusementPark
    let authorizationWindow: AuthorizationWindow
    
    init(authorizationWindow: AuthorizationWindow, amusementPark: AmusementPark) {
        self.authorizationWindow = authorizationWindow
        self.amusementPark = amusementPark
        execute()
    }
    
    func getStatistic()->(Double, Double) {
        var monthIncome = 0.0
        var dayIncome = 0.0
        for attraction in amusementPark.attractions {
            monthIncome += (Double(attraction.soldTiketsForMonth) * attraction.price)
            dayIncome += (Double(attraction.soldTicketsForDay) * attraction.price)
        }
        return (dayIncome, monthIncome)
    }
    
    func execute() {
        authorizationWindow.mainMenuWindow.parkStatisticWindow.setLabels(dayProfit: getStatistic().0, monthProfit: getStatistic().1)
    }
}
