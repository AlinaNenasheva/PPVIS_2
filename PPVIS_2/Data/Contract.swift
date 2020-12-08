//
//  Contract.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation

class Contract {
    let dateOfSigning: Date
    let dateOfExpiring: Date
    
    init(dateOfSigning: Date, dateOfExpiring: Date) {
        self.dateOfExpiring = dateOfExpiring
        self.dateOfSigning = dateOfSigning
    }
}
