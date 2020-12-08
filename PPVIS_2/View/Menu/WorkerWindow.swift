//
//  WorkerWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class WorkerWindow: UIViewController {

    @IBOutlet var deleteWorkerButton: UIButton!
    @IBOutlet var fineWorkerButton: UIButton!
    @IBOutlet var rewardWorkerButton: UIButton!
    @IBOutlet var changeHoursButton: UIButton!
    @IBOutlet var changePlaceButton: UIButton!
    @IBOutlet var letWorkerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func getDeleteWorkerButton()-> UIButton {
        return deleteWorkerButton
    }
    func getFineWorkerButton()-> UIButton {
        return fineWorkerButton
    }
    
    func getRewardWorkerButton()-> UIButton {
        return rewardWorkerButton
    }
    
    func getChangeHoursButton()-> UIButton {
        return changeHoursButton
    }
    
    func getChangePlaceButton()-> UIButton {
        return changePlaceButton
    }
    
    func getLetWorkerButton()-> UIButton {
        return letWorkerButton
    }
    

}
