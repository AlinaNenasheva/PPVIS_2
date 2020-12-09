//
//  EventWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class EventWindow: UIViewController {

//    @IBOutlet weak var createEventButton: UIButton!
    @IBOutlet weak var numberOfGuestsTextField: UITextField!
    @IBOutlet weak var dateOfEventPicker: UIDatePicker!
    @IBOutlet weak var menuTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private var createButtonHandler: (() -> ())?
      
      func setCreateButtonHandler(_ handler: @escaping () -> ()) {
          createButtonHandler = handler
      }
      
      @IBAction func createButtonPressed(_ sender: Any) {
        createButtonHandler?()
      }
    
//    func getCreateButton()->UIButton {
//        return createEventButton
//    }
    
    func getDateFromDatePicker()-> Date {
        return dateOfEventPicker.date
    }
    
    func getNumberOfGuestsButton()-> Int {
        return Int(numberOfGuestsTextField.text ?? "") ?? 0
    }
 
    func getTextView()-> [String] {
        var menu = [String]()
        var menuPosititon = ""
        for char in menuTextView.text {
            if char != "\n" {
                menuPosititon.append(char)
            } else {
                menu.append(menuPosititon)
                menuPosititon = ""
            }
        }
        return menu
    }
}
