//
//  AttractionWorker.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 30.11.20.
//

import Foundation
 

class AttractionWorker: Worker {
    var maintainedAttraction: String
     
    init(maintainedAttraction: String, fullName: String, post: String, workingOffDays: Int, vocationDays: Int, contract: Contract, payCheck: PayCheck, workingHours: WorkingHours) {
        self.maintainedAttraction = maintainedAttraction
        super.init(fullName: fullName, post: post, workingOffDays: workingOffDays, vocationDays: vocationDays, contract: contract, payCheck: payCheck, workingHours: workingHours)
    }
}
