//
//  Timer.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation
import UIKit

class Autotimer {
    var timer = 0
    
    func updateTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.timer += 1
        }
    }
}
