//
//  MainMenu.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class MainMenuWindow: UIViewController {
    
    @IBOutlet weak var manipulateWorkerButton: UIButton!
    @IBOutlet weak var manipulateAttractionButton: UIButton!
    @IBOutlet weak var addRecordButton: UIButton!
    @IBOutlet weak var parkStatisticButton: UIButton!
    @IBOutlet weak var organizeEventButton: UIButton!
    var workerWindow = WorkerWindow()
    var attractionWindow = AttractionWindow()
    var eventWindow = EventWindow()
    var parkStatisticWindow = ParkStatisticWindow()
    var addRecordWindow = AddRecordWindow()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workerWindow = storyboard?.instantiateViewController(identifier: String(describing: WorkerWindow.self)) as! WorkerWindow
        attractionWindow = storyboard?.instantiateViewController(identifier: String(describing: AttractionWindow.self)) as! AttractionWindow
        eventWindow = storyboard?.instantiateViewController(identifier: String(describing: EventWindow.self)) as! EventWindow
        parkStatisticWindow = storyboard?.instantiateViewController(identifier: String(describing: ParkStatisticWindow.self)) as! ParkStatisticWindow
        addRecordWindow = storyboard?.instantiateViewController(identifier: String(describing: AddRecordWindow.self)) as! AddRecordWindow

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
