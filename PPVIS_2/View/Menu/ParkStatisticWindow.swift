//
//  ParkStatisticWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class ParkStatisticWindow: UIViewController {

    @IBOutlet weak var monthProfitLabel: UILabel!
    @IBOutlet weak var dayProfitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    func getMonthProfitLabel()-> UILabel {
        return monthProfitLabel
    }
    
    func getDayProfitLabel()-> UILabel {
        return dayProfitLabel
    }
    
    func setLabels(dayProfit: Double, monthProfit: Double) {
        dayProfitLabel.text = "Sum for day: \(dayProfit)"
        monthProfitLabel.text = "Sum for month \(monthProfit)"
    }
}
