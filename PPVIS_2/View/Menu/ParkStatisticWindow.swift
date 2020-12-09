//
//  ParkStatisticWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class ParkStatisticWindow: UIViewController {


    @IBOutlet weak var dayProfitLabel: UILabel!
    @IBOutlet weak var monthProfitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setLabels(dayProfit: Double, monthProfit: Double) {
        dayProfitLabel.text = "Sum for day: \(dayProfit)"
        monthProfitLabel.text = "Sum for month \(monthProfit)"
    }
}
