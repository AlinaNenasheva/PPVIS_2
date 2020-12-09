//
//  Injector.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation
import UIKit
class Injector {
    let attractionController: AttractionController
    let workerController: WorkerController
    let eventOrganizer: EventOrganizer
    let verifyer: Verifyer
    let weatherService: WeatherService
    let parkStatisticGetter: ParkStatisticGetter
    var authorizationWindow = AuthorizationWindow()
    let amusementPark: AmusementPark
    
    init() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        authorizationWindow = storyboard.instantiateViewController(identifier: String(describing: AuthorizationWindow.self)) as! AuthorizationWindow
        verifyer = Verifyer(authorizationWindow: authorizationWindow)
        amusementPark = AmusementPark()
        attractionController = AttractionController(amusementPark: amusementPark, authorizationWindow: authorizationWindow, verifyer: verifyer)
        workerController = WorkerController(amusementPark: amusementPark, authorizationWindow: authorizationWindow, verifyer: verifyer)
        eventOrganizer = EventOrganizer(amusementPark: amusementPark, authorizationWindow: authorizationWindow)
        weatherService = WeatherService(amusementPark: amusementPark)
        parkStatisticGetter = ParkStatisticGetter(authorizationWindow: authorizationWindow, amusementPark: amusementPark)
        createPark()
    }
    
    func createPark() {
        amusementPark.updateTickets()
        amusementPark.autocountPrices()
    }
    
}

