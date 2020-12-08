//
//  Event.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation

class Event {
    var date: Date
    var menu: [String]
    var numberOfGuests: Int
    
    init(date: Date, menu: [String], numberOfGuests: Int) {
        self.date = date
        self.menu = menu
        self.numberOfGuests = numberOfGuests
    }
}
