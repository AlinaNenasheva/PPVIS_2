//
//  WorkingHours.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation

class WorkingHours {
    var dateOfStart: Int
    var dateOfEnd: Int
    
    init(dateOfStart: Int, dateOfEnd: Int) {
        self.dateOfEnd = dateOfEnd
        self.dateOfStart = dateOfStart
    }
}
