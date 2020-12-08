//
//  AttractionController.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation

class AttractionController: Controller {
    let amusementPark: AmusementPark
    let mainMenu: MainMenu
    let verifyer: Verifyer
    
    init(amusementPark: AmusementPark, mainMenu: MainMenu, verifyer: Verifyer) {
        self.amusementPark = amusementPark
        self.mainMenu = mainMenu
        self.verifyer = verifyer
    }
    
    @objc func changePrice() {
        let infoFromChangePriceDialog = mainMenu.attractionWindow.createChangePriceDialog()
        let price = infoFromChangePriceDialog.1
        let attractionId = infoFromChangePriceDialog.0
        let authoInfo = mainMenu.attractionWindow.createVerifyDialog()
        let login = authoInfo.0
        let password = authoInfo.1
        if verifyer.verifyPassword(login: login, password: password) {
            for attraction in amusementPark.attractions {
                if attraction.id == attractionId {
                    attraction.price = price
                    break
                }
            }
        }
    }
    
    func closeAttraction(attractionId: String) {
            for attraction in amusementPark.attractions {
                if attraction.id == attractionId {
                    attraction.opened = false
                    break
                }
            }
    }
    
    func deleteAttraction(attractionId: String) {
        amusementPark.attractions = amusementPark.attractions.filter { $0.id != attractionId }
    }
    
    @objc func openAttraction() {
        let attractionId = mainMenu.attractionWindow.createOpenDialog()
        for attraction in amusementPark.attractions {
            if attraction.id == attractionId {
                attraction.opened = true
                break
            }
        }
    }
    
    @objc func determinateReason () {
        let infoFromCloseDIalog = mainMenu.attractionWindow.createCloseDialog()
        let reason = infoFromCloseDIalog.0
        let attractionId = infoFromCloseDIalog.1
        let authoInfo = mainMenu.attractionWindow.createVerifyDialog()
        let login = authoInfo.0
        let password = authoInfo.1
        if  reason == 1 {
            if verifyer.verifyPassword(login: login, password: password) {
                deleteAttraction(attractionId: attractionId)
            }
        } else if reason == 2 {
            closeAttraction(attractionId: attractionId)
        }
    }
    
    
    @objc func updateSoldTicketsAndPassibility() {
        let attractionId = mainMenu.attractionWindow.createAddTicketsDialog()
        for attraction in amusementPark.attractions {
            if attraction.id == attractionId {
                attraction.soldTicketsForDay += 1
                attraction.soldTiketsForMonth += 1
                attraction.passibility += 1
                break
            }
        }
    }
    
    @objc func analyzePopularity(){
        let attractionId = mainMenu.attractionWindow.createAnalysisDialog()
        var analysisInfo = ""
        for attraction in amusementPark.attractions {
            if attraction.id == attractionId {
                if countOverallRateAndPassibility().0 < attraction.rate {
                    analysisInfo = "This attraction's rate is more than average."
                } else {
                    analysisInfo = "This attraction's rate is less than average."
                }
                if countOverallRateAndPassibility().1 < Double(attraction.passibility) {
                    analysisInfo += "This attraction's passibility is more than average."
                } else {
                    analysisInfo += "This attraction's passibility is less than average."
                }
            }
            if isMinimalPassibilityAndRate(attractionRate: attraction.rate, attractionPassibility: Double(attraction.passibility)) {
                mainMenu.attractionWindow.showAnalysisDialogForUnprofitable(message: analysisInfo)
            } else {
                mainMenu.attractionWindow.showAnalysisDialog(message: analysisInfo)
            }
        }
    }
    
    func isMinimalPassibilityAndRate(attractionRate: Double, attractionPassibility: Double)-> Bool {
        var minimalRate = amusementPark.attractions.first?.rate ?? 0
        var minimalPassibility = amusementPark.attractions.first?.passibility ?? 0
        for attraction in amusementPark.attractions {
            if minimalRate > attraction.rate {
                minimalRate = attraction.rate
            }
            if minimalPassibility > attraction.passibility {
                minimalPassibility = attraction.passibility
            }
        }
        if attractionRate == minimalRate && attractionPassibility == Double(minimalPassibility) {
            return true
        } else {
            return false
        }
    }
    
    func countOverallRateAndPassibility()-> (Double, Double) {
        var rate = 0.0
        var passibility = 0.0
        for attraction in amusementPark.attractions {
            rate += attraction.rate
            passibility += Double(attraction.passibility)
        }
        if amusementPark.attractions.count != 0 {
            rate = rate / Double(amusementPark.attractions.count)
            passibility = passibility / Double(amusementPark.attractions.count)
        }
        return (rate, passibility)
    }
    
    @objc func getStatistic() {
        let attractionId = mainMenu.attractionWindow.createStatisticDialog()
        for attraction in amusementPark.attractions {
            if attraction.id == attractionId {
                mainMenu.attractionWindow.showStatisticDialog(dayIncome: Double(attraction.soldTicketsForDay) * attraction.price, monthIncome: Double(attraction.soldTiketsForMonth) * attraction.price)
            }
        }
    }
    
    @objc func addAttraction() {
        let attractionId = mainMenu.addRecordWindow.getAttractionId()
        let temperature = mainMenu.addRecordWindow.getTemperature()
        let windSpeed = mainMenu.addRecordWindow.getWindSpeed()
        let precipitation = mainMenu.addRecordWindow.getPrecipitation()
        let price = mainMenu.addRecordWindow.getPrice()
        let rate = mainMenu.addRecordWindow.getRate()
        let dateofStart = mainMenu.addRecordWindow.getAttractionStartWorkingHours()
        let dateOfEnd =  mainMenu.addRecordWindow.getAttractionEndWorkingHours()
        let attraction = Attraction(id: attractionId, weatherCondition: WeatherCondition(temperature: temperature, windSpeed: windSpeed, precipitation: precipitation), price: price, rate: rate, workingHours: WorkingHours(dateOfStart: dateofStart, dateOfEnd: dateOfEnd))
        amusementPark.attractions.append(attraction)
    }
    
    func execute() {
        mainMenu.attractionWindow.getCloseButton().addTarget(self, action: #selector(determinateReason), for: .touchUpInside)
        mainMenu.attractionWindow.getOpenButton().addTarget(self, action: #selector(openAttraction), for: .touchUpInside)
        mainMenu.attractionWindow.getAnalyzePopularityButton().addTarget(self, action: #selector(analyzePopularity), for: .touchUpInside)
        mainMenu.attractionWindow.getStatisticButton().addTarget(self, action: #selector(getStatistic), for: .touchUpInside)
        mainMenu.attractionWindow.getChangePriceButton().addTarget(self, action: #selector(changePrice), for: .touchUpInside)
        mainMenu.attractionWindow.getAddTicketsButton().addTarget(self, action: #selector(updateSoldTicketsAndPassibility), for: .touchUpInside)
        mainMenu.addRecordWindow.getAddAttractionButton().addTarget(self, action: #selector(addAttraction), for: .touchUpInside)
    }
}


