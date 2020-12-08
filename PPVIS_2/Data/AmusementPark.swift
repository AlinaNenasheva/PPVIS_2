//
//  AmusementPark.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation

class AmusementPark {
    var attractionWorkers = [AttractionWorker]()
    var attractions = [Attraction]()
    var workingHours = WorkingHours(dateOfStart: 7, dateOfEnd: 23)
    var events = [Event]()
    
    func updateTickets() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            if Date() == Date().startOfMonth {
                for attraction in self.attractions {
                    attraction.soldTiketsForMonth = 0
                }
            }
            if Date() == Date().startOfDay {
                for attraction in self.attractions {
                    attraction.soldTicketsForDay = 0
                }
            }
        }
    }
    
    
}

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var startOfMonth: Date {

        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)

        return  calendar.date(from: components)!
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)!
    }
}
