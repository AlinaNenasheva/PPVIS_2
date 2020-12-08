//
//  Application.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 1.12.20.
//

import Foundation

class Application {
    var reason: String
    var workerName: String
    var administratorName = "Nenasheva Alina"
    var dateOfFiring = Date()
    
    init(reason: String, workerName: String) {
        self.reason = reason
        self.workerName = workerName
        let day = dateOfFiring.shortDate
        let result = "I, \(workerName), have got fired for a reason \(reason) by \(administratorName) on date \(day)"
        let filename = getDocumentsDirectory().appendingPathComponent("application.pdf")
        do {
            try result.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension Date {

  var shortDate: Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    let strDate = formatter.string(from: self)
    let modifiedDate = formatter.date(from: strDate)
    return modifiedDate!
  }
}
