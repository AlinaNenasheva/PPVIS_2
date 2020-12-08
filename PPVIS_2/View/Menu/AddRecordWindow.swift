//
//  AddRecordWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class AddRecordWindow: UIViewController {

    @IBOutlet weak var attractionView: UIView!
    @IBOutlet weak var workerView: UIView!
    @IBOutlet weak var workerViewButton: UIButton!
    @IBOutlet weak var attractionViewButton: UIButton!
    
    @IBOutlet weak var workerNameTextField: UITextField!
    @IBOutlet weak var maintainedAttractionTextField: UITextField!
    @IBOutlet weak var workerPostTextField: UITextField!
    @IBOutlet weak var startContractTermsTextField: UITextField!
    @IBOutlet weak var endContractTermsTextField: UITextField!
    @IBOutlet weak var startWorkingHoursTextField: UITextField!
    @IBOutlet weak var endWorkingHoursTextField: UITextField!
    @IBOutlet weak var addWorkerButton: UIButton!
    
    
    @IBOutlet weak var attractionIdTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var startAttractionWorkingHoursTextField: UITextField!
    @IBOutlet weak var endAttractionWorkingHoursTextField: UITextField!
    @IBOutlet weak var precipitationSwitch: UISwitch!
    @IBOutlet weak var windSpeedTextField: UITextField!
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var addAttractionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func getAddAttractionButton()-> UIButton {
        return addAttractionButton
    }
    
    func getAddWorkerButton()-> UIButton {
        return addWorkerButton
    }
    
    func getWorkerName()-> String {
        return workerNameTextField.text ?? "unknown"
    }
    
    func getWorkerPost()-> String {
        return workerPostTextField.text ?? "unknown"
    }
    
    func getMaintainedAttraction()-> String {
        return maintainedAttractionTextField.text ?? ""
    }
    
    func getStartContractTerm()-> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from:startContractTermsTextField.text ?? "") ?? Date() - 20000
    }
    
    func getEndContractTerm()-> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from:endContractTermsTextField.text ?? "") ?? Date()
    }
    
    func getStartWorkingHours()-> Int {
        return Int(startWorkingHoursTextField.text ?? "") ?? 8
    }
    
    func getEndWorkingHours()-> Int {
        return Int(endWorkingHoursTextField.text ?? "") ?? 16
    }
    
    func getPrice()-> Double {
        return Double(priceTextField.text ?? "") ?? 0.0
    }
    
    func getRate()-> Double {
        return Double(rateTextField.text ?? "") ?? 0.0
    }

    func getPrecipitation()-> Bool {
        return precipitationSwitch.isOn
    }
    
    func getTemperature()-> Int {
        return Int(temperatureTextField.text ?? "") ?? 0
    }
    
    func getWindSpeed()-> Double {
        return Double(windSpeedTextField.text ?? "") ?? 0.0
    }
    
    func getAttractionId()-> String {
        return attractionIdTextField.text ?? "unknown"
    }
    
    func getAttractionStartWorkingHours()-> Int {
        return Int(startAttractionWorkingHoursTextField.text ?? "") ?? 8
    }
    
    func getAttractionEndWorkingHours()-> Int {
        return Int(endAttractionWorkingHoursTextField.text ?? "") ?? 16
    }
    
    @IBAction func onAttractionViewButtonPressed(_ sender: Any) {
        attractionViewButton.isSelected = !attractionViewButton.isSelected
        if attractionViewButton.isSelected {
            workerViewButton.isSelected = false
            attractionView.alpha = 1
            workerView.alpha = 0
        }
    }
    
    @IBAction func onWorkerViewButtonPressed(_ sender: Any) {
        workerViewButton.isSelected = !workerViewButton.isSelected
        if workerViewButton.isSelected {
            attractionViewButton.isSelected = false
            workerView.alpha = 1
            attractionView.alpha = 0
        }
    }
    
}
