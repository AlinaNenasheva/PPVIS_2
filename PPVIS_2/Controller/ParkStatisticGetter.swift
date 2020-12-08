//
//  ParkStatisticGetter.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 6.12.20.
//

import Foundation

class ParkStatisticGetter: Controller {
    let amusementPark: AmusementPark
    let mainMenu: MainMenu
    
    init(mainMenu: MainMenu, amusementPark: AmusementPark) {
        self.mainMenu = mainMenu
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
        mainMenu.parkStatisticWindow.setLabels(dayProfit: getStatistic().0, monthProfit: getStatistic().1)
    }
}
