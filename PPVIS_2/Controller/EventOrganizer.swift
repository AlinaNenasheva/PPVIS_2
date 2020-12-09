//
//  EventOrganizer.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation

class EventOrganizer {
    let amusementPark: AmusementPark
    let mainMenu: MainMenuWindow
    
    init(amusementPark: AmusementPark, mainMenu: MainMenuWindow) {
        self.amusementPark = amusementPark
        self.mainMenu = mainMenu
        execute()
    }
    
    func execute() {
        mainMenu.eventWindow.setCreateButtonHandler(setEvent)
//        mainMenu.eventWindow.getCreateButton().addTarget(self, action: #selector(setEvent), for: .touchUpInside)
    }
    
    @objc func setEvent(){
        let date = mainMenu.eventWindow.getDateFromDatePicker()
        let numberOfGuests = mainMenu.eventWindow.getNumberOfGuestsButton()
        let menu = mainMenu.eventWindow.getTextView()
        let event = Event(date: date, menu: menu, numberOfGuests: numberOfGuests)
        amusementPark.events.append(event)
    }
}
