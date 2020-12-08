//
//  Worker.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation

class Worker {
    let fullName: String
    let post: String
    var workingOffDays: Int
    var onVocation: Bool
    var vocationDays: Int
    let contract: Contract
    let payCheck: PayCheck
    var workingHours: WorkingHours
    
    init (fullName: String, post: String, workingOffDays: Int, vocationDays: Int, contract: Contract, payCheck: PayCheck, workingHours: WorkingHours) {
        self.fullName = fullName
        self.post = post
        self.workingOffDays = workingOffDays
        self.vocationDays = vocationDays
        onVocation = false
        self.contract = contract
        self.payCheck = payCheck
        self.workingHours = workingHours
    }
}
