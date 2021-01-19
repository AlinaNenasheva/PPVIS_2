//
//  PayCheckRecord.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 1.12.20.
//

import Foundation

class PayCheckRecord {
    let money: Double
    let typeOfRecord: String
    
    init(money: Double, typeOfRecord: String) {
        self.money = money
        self.typeOfRecord = typeOfRecord
    }
}
