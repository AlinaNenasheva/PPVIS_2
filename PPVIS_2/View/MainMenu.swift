//
//  MainMenu.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class MainMenu: UIViewController {
    
    @IBOutlet weak var manipulateWorkerButton: UIButton!
    @IBOutlet weak var manipulateAttractionButton: UIButton!
    @IBOutlet weak var addRecordButton: UIButton!
    @IBOutlet weak var parkStatisticButton: UIButton!
    @IBOutlet weak var organizeEventButton: UIButton!
    let workerWindow = WorkerWindow()
    let attractionWindow = AttractionWindow()
    let eventWindow = EventWindow()
    let parkStatisticWindow = ParkStatisticWindow()
    let addRecordWindow = AddRecordWindow()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onShowWorkerWindowButtonPressed(_ sender: Any) {
        present(workerWindow, animated: true)
    }
    
    @IBAction func onShowAttractionWindowButtonPressed(_ sender: Any) {
        present(attractionWindow, animated: true)
    }
    
    @IBAction func onShowEventOrganizationWindowButtonPressed(_ sender: Any) {
        present(eventWindow, animated: true)
    }
    
    @IBAction func onShowStatisticWindowButtonPressed(_ sender: Any) {
        present(parkStatisticWindow, animated: true)
    }
    
    @IBAction func onShowAddRecordWindowButtonPressed(_ sender: Any) {
        present(addRecordWindow, animated: true)
    }
    
}
