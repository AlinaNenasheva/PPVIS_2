//
//  AuthorizationWindow.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import UIKit

class AuthorizationWindow: UIViewController {
    
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    let mainMenu = MainMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    func getPasswordTextField()-> String {
        return passwordTextField.text ?? ""
    }
    
    func getLoginTextField()-> String {
        return loginTextField.text ?? ""
    }
    
    func getSubmitButton()-> UIButton {
        return submitButton
    }
    
    func presentMainMenu() {
        present(mainMenu, animated: true)
    }
}



