//
//  AttractionWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class AttractionWindow: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var closeButtonHandler: (() -> ())?
      
      func setCloseButtonHandler(_ handler: @escaping () -> ()) {
          closeButtonHandler = handler
      }
      
      @IBAction func closeButtonPressed(_ sender: Any) {
          closeButtonHandler?()
      }
    
    private var openButtonHandler: (() -> ())?
      
      func setOpenButtonHandler(_ handler: @escaping () -> ()) {
          openButtonHandler = handler
      }
      
      @IBAction func openButtonPressed(_ sender: Any) {
          openButtonHandler?()
      }
    
    private var changePriceButtonHandler: (() -> ())?
      
      func setoChangePriceButtonHandler(_ handler: @escaping () -> ()) {
          changePriceButtonHandler = handler
      }
      
      @IBAction func changePriceButtonPressed(_ sender: Any) {
        changePriceButtonHandler?()
      }
    
    private var analyzeButtonHandler: (() -> ())?
      
      func setAnalyzeButtonHandler(_ handler: @escaping () -> ()) {
          analyzeButtonHandler = handler
      }
      
      @IBAction func analyzeButtonPressed(_ sender: Any) {
        analyzeButtonHandler?()
      }
    
    private var statisticButtonHandler: (() -> ())?
      
      func setStatisticeButtonHandler(_ handler: @escaping () -> ()) {
          statisticButtonHandler = handler
      }
      
      @IBAction func statisticButtonPressed(_ sender: Any) {
        statisticButtonHandler?()
      }
    
    private var addTicketsButtonHandler: (() -> ())?
      
      func setAddTicketsButtonHandler(_ handler: @escaping () -> ()) {
          addTicketsButtonHandler = handler
      }
      
      @IBAction func addTicketsButtonPressed(_ sender: Any) {
        addTicketsButtonHandler?()
      }
    
    func createCloseDialog()-> (Int, String) {
        var reasonNumber = 0
        var enteredAttractionId: String = ""
        let alert = UIAlertController(title: "Close attraction", message: "Choose reason to close", preferredStyle: .alert)
        alert.addTextField { (attractionId) in attractionId.placeholder = "Attraction id"
            enteredAttractionId =  attractionId.text ?? ""
        }
         let unprofitability = UIAlertAction(title: "Unprofitability", style: .cancel) { (_) in
            reasonNumber = 1
            }
         alert.addAction(unprofitability)
        let technicalDifficulties = UIAlertAction(title: "Technical difficulties", style: .cancel) { (_) in
            reasonNumber = 2
            
        }
        alert.addAction(technicalDifficulties)
         present(alert, animated: true, completion: nil)
        return (reasonNumber, enteredAttractionId)
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
    
    func createOpenDialog()-> String {
        var enteredAttractionId: String = ""
        let alert = UIAlertController(title: "Open attraction", message: "Choose what attraction you want to open", preferredStyle: .alert)
        alert.addTextField { (attractionId) in attractionId.placeholder = "Attraction id"
            enteredAttractionId =  attractionId.text ?? ""
        }
         let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            }
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return enteredAttractionId
    }
    
    func createStatisticDialog()-> String {
        var enteredAttractionId: String = ""
        let alert = UIAlertController(title: "See statistic", message: "Choose what attraction you want to look through", preferredStyle: .alert)
        alert.addTextField { (attractionId) in attractionId.placeholder = "Attraction id"
            enteredAttractionId =  attractionId.text ?? ""
        }
         let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            }
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return enteredAttractionId
    }
    
    func showStatisticDialog(dayIncome: Double, monthIncome: Double) {
        let alert = UIAlertController(title: "Statistic", message: "Sum for day: \(dayIncome)\n Sum for month: \(monthIncome)", preferredStyle: .alert)
         let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            }
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
    }
    
    func createAddTicketsDialog()-> String {
        var enteredAttractionId: String = ""
        let alert = UIAlertController(title: "Add tickets", message: "Choose to what attraction you want to add tickets", preferredStyle: .alert)
        alert.addTextField { (attractionId) in attractionId.placeholder = "Attraction id"
            enteredAttractionId =  attractionId.text ?? ""
        }
         let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            }
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return enteredAttractionId
    }
    
    func createChangePriceDialog()-> (String, Double) {
        var enteredAttractionId: String = ""
        var newPrice = 0.0
        let alert = UIAlertController(title: "Change price for attraction", message: nil, preferredStyle: .alert)
        alert.addTextField { (attractionId) in attractionId.placeholder = "Attraction id"
            enteredAttractionId =  attractionId.text ?? ""
        }
        alert.addTextField { (attractionId) in attractionId.placeholder = "Price"
            newPrice =  Double(attractionId.text ?? "") ?? 0.0
        }
         let submit = UIAlertAction(title: "Submit", style: .default, handler: nil)
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return (enteredAttractionId, newPrice)
    }
    
    func createAnalysisDialog()-> String {
        var enteredAttractionId: String = ""
        let alert = UIAlertController(title: nil, message: "Choose what attraction you want to analyze", preferredStyle: .alert)
        alert.addTextField { (attractionId) in attractionId.placeholder = "Attraction id"
            enteredAttractionId =  attractionId.text ?? ""
        }
         let submit = UIAlertAction(title: "Submit", style: .default, handler: nil)
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
        return enteredAttractionId
    }
    
    func showAnalysisDialog(message: String) {
        let alert = UIAlertController(title: "See analysis", message: message, preferredStyle: .alert)
         let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            }
         alert.addAction(submit)
         present(alert, animated: true, completion: nil)
    }
    
    func showAnalysisDialogForUnprofitable(message: String) {
        let alert = UIAlertController(title: "See analysis", message: "\(message) Attraction is unprofitable.", preferredStyle: .alert)
         let changePrice = UIAlertAction(title: "Change price", style: .default) { (_) in
            self.createChangePriceDialog()
            }
         alert.addAction(changePrice)
         present(alert, animated: true, completion: nil)
    }
}
