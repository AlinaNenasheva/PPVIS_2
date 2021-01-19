//
//  WorkerWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class WorkerWindow: UIViewController {

//    @IBOutlet var deleteWorkerButton: UIButton!
//    @IBOutlet var fineWorkerButton: UIButton!
//    @IBOutlet var rewardWorkerButton: UIButton!
//    @IBOutlet var changeHoursButton: UIButton!
//    @IBOutlet var changePlaceButton: UIButton!
//    @IBOutlet var letWorkerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private var deleteButtonHandler: (() -> ())?
      
      func setDeleteButtonHandler(_ handler: @escaping () -> ()) {
        deleteButtonHandler = handler
      }
      
      @IBAction func deleteButtonPressed(_ sender: Any) {
          deleteButtonHandler?()
      }
    
    private var fineButtonHandler: (() -> ())?
      
      func setFineButtonHandler(_ handler: @escaping () -> ()) {
          fineButtonHandler = handler
      }
      
      @IBAction func fineButtonPressed(_ sender: Any) {
          fineButtonHandler?()
      }
    
    private var rewardButtonHandler: (() -> ())?
      
      func setRewardButtonHandler(_ handler: @escaping () -> ()) {
          rewardButtonHandler = handler
      }
      
      @IBAction func rewardButtonPressed(_ sender: Any) {
        rewardButtonHandler?()
      }
    
    private var changeHoursButtonHandler: (() -> ())?
      
      func setChangeHoursButtonHandler(_ handler: @escaping () -> ()) {
          changeHoursButtonHandler = handler
      }
      
      @IBAction func changeHoursButtonPressed(_ sender: Any) {
        changeHoursButtonHandler?()
      }
    
    private var changePlaceButtonHandler: (() -> ())?
      
      func setChangePlaceButtonHandler(_ handler: @escaping () -> ()) {
        changePlaceButtonHandler = handler
      }
      
      @IBAction func changePlaceButtonPressed(_ sender: Any) {
        changePlaceButtonHandler?()
      }
    
    private var letButtonHandler: (() -> ())?
      
      func setLetButtonHandler(_ handler: @escaping () -> ()) {
          letButtonHandler = handler
      }
      
      @IBAction func letButtonPressed(_ sender: Any) {
        letButtonHandler?()
      }
    
//    func getDeleteWorkerButton()-> UIButton {
//        return deleteWorkerButton
//    }
//    func getFineWorkerButton()-> UIButton {
//        return fineWorkerButton
//    }
//
//    func getRewardWorkerButton()-> UIButton {
//        return rewardWorkerButton
//    }
//
//    func getChangeHoursButton()-> UIButton {
//        return changeHoursButton
//    }
//
//    func getChangePlaceButton()-> UIButton {
//        return changePlaceButton
//    }
//
//    func getLetWorkerButton()-> UIButton {
//        return letWorkerButton
//    }
    
    func createFireDialog()-> (Int, String) {
        var reasonNumber = 0
        var enteredWorkerName: String = ""
        let alert = UIAlertController(title: "Fire worker", message: "Choose reason to fire", preferredStyle: .alert)
        alert.addTextField { (workerName) in workerName.placeholder = "Worker full name"
            enteredWorkerName =  workerName.text ?? ""
        }
         let workerWill = UIAlertAction(title: "Worker Will", style: .cancel) { (_) in
            reasonNumber = 1
            }
         alert.addAction(workerWill)
        let violation = UIAlertAction(title: "Violation", style: .cancel) { (_) in
            reasonNumber = 2
        }
        alert.addAction(violation)
         present(alert, animated: true, completion: nil)
        return (reasonNumber, enteredWorkerName)
    }

    func createVerifyDialog()-> (String, String) {
        var password: String = ""
        var login: String = ""
        let alert = UIAlertController(title: "Verify actions", message: "Enter login and password", preferredStyle: .alert)
        alert.addTextField { (tf) in tf.isSecureTextEntry = true
            tf.placeholder = "password"
            login = tf.text ?? ""
        }
        alert.addTextField { (tf) in tf.isSecureTextEntry = true
            tf.placeholder = "login"
            password = tf.text ?? ""
        }
         let submit = UIAlertAction(title: "Submit", style: .default, handler: nil)
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return (login, password)
    }
    
    func createFineDialog()-> (Int, String) {
        var reasonNumber = 0
        var enteredWorkerName: String = ""
        let alert = UIAlertController(title: "Fine worker", message: "Choose punishment", preferredStyle: .alert)
        alert.addTextField { (workerName) in workerName.placeholder = "Worker full name"
            enteredWorkerName =  workerName.text ?? ""
        }
         let workOff = UIAlertAction(title: "WorkOff days", style: .cancel) { (_) in
            reasonNumber = 1
            }
         alert.addAction(workOff)
        let fine = UIAlertAction(title: "Fine", style: .cancel) { (_) in
            reasonNumber = 2
        }
        alert.addAction(fine)
         present(alert, animated: true, completion: nil)
        return (reasonNumber, enteredWorkerName)
    }
    
    func createPayCheckManipulationTypeDialog(message: String)->Double {
        var enteredNum = 0.0
        let alert = UIAlertController(title: "Enter \(message)", message: nil, preferredStyle: .alert)
        alert.addTextField { (workerName) in workerName.placeholder = "\(message)"
            enteredNum =  Double(workerName.text ?? "") ?? 0.0
        }
         let submit = UIAlertAction(title: "Submit", style: .cancel, handler: nil)
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return enteredNum
    }
    
    func createRewardDialog()-> (Int, String) {
        var reasonNumber = 0
        var enteredWorkerName: String = ""
        let alert = UIAlertController(title: "Reward worker", message: "Choose reward", preferredStyle: .alert)
        alert.addTextField { (workerName) in workerName.placeholder = "Worker full name"
            enteredWorkerName =  workerName.text ?? ""
        }
         let vocation = UIAlertAction(title: "Vocation days", style: .cancel) { (_) in
            reasonNumber = 1
            }
         alert.addAction(vocation)
        let reward = UIAlertAction(title: "Reward", style: .cancel) { (_) in
            reasonNumber = 2
        }
        alert.addAction(reward)
         present(alert, animated: true, completion: nil)
        return (reasonNumber, enteredWorkerName)
    }
    
    func createChangePlaceDialog()-> (String, String) {
        var newPlace = ""
        var enteredWorkerName: String = ""
        let alert = UIAlertController(title: "Change worker's place", message: "Enter new attraction id", preferredStyle: .alert)
        alert.addTextField { (workerName) in workerName.placeholder = "Worker full name"
            enteredWorkerName =  workerName.text ?? ""
        }
        alert.addTextField { (place) in place.placeholder = "Worker new place"
            newPlace =  place.text ?? ""
        }
         let submit = UIAlertAction(title: "Submit", style: .cancel, handler: nil)
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return (newPlace, enteredWorkerName)
    }
    
    func createChangeHoursDialog()-> (Int, Int, String) {
        var start = 0
        var end = 0
        var enteredWorkerName: String = ""
        let alert = UIAlertController(title: "Change worker's hours", message: "Enter new working hours", preferredStyle: .alert)
        alert.addTextField { (workerName) in workerName.placeholder = "Worker full name"
            enteredWorkerName =  workerName.text ?? ""
        }
        alert.addTextField { (startHours) in startHours.placeholder = "Start"
            start =  Int(startHours.text ?? "") ?? 8
        }
        alert.addTextField { (endHours) in endHours.placeholder = "End"
            end =  Int(endHours.text ?? "") ?? 16
        }
         let submit = UIAlertAction(title: "Submit", style: .cancel, handler: nil)
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return (start, end, enteredWorkerName)
    }
    
    func createLetDialog()-> String {
        var enteredWorkerName: String = ""
        let alert = UIAlertController(title: "Let worker", message: "Choose worker to let", preferredStyle: .alert)
        alert.addTextField { (workerName) in workerName.placeholder = "Worker full name"
            enteredWorkerName =  workerName.text ?? ""
        }
         let submit = UIAlertAction(title: "Submit", style: .cancel, handler: nil)
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return enteredWorkerName
    }
}
