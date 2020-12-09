//
//  EventOrganizer.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation

class EventOrganizer {
    let amusementPark: AmusementPark
    let authorizationWindow: AuthorizationWindow
    
    init(amusementPark: AmusementPark, authorizationWindow: AuthorizationWindow) {
        self.amusementPark = amusementPark
        self.authorizationWindow = authorizationWindow
        execute()
    }
    
    func execute() {
        authorizationWindow.mainMenuWindow.eventWindow.setCreateButtonHandler(setEvent)
//        mainMenu.eventWindow.getCreateButton().addTarget(self, action: #selector(setEvent), for: .touchUpInside)
    }
    
    @objc func setEvent(){
        let date = authorizationWindow.mainMenuWindow.eventWindow.getDateFromDatePicker()
        let numberOfGuests = authorizationWindow.mainMenuWindow.eventWindow.getNumberOfGuestsButton()
        let menu = authorizationWindow.mainMenuWindow.eventWindow.getTextView()
        let event = Event(date: date, menu: menu, numberOfGuests: numberOfGuests)
        amusementPark.events.append(event)
    }
}
