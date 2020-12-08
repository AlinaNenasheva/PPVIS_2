//
//  Verifyer.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation

class Verifyer: Controller {
    let authorizationWindow: AuthorizationWindow
    
    init(authorizationWindow: AuthorizationWindow) {
        self.authorizationWindow = authorizationWindow
        execute()
    }
    
    func execute() {
        authorizationWindow.getSubmitButton().addTarget(self, action: #selector(verifyPasswordForEntrance), for: .touchUpInside)
//        verifyPasswordFo(login: authorizationWindow.getLoginTextField(), password: authorizationWindow.getPasswordTextField())
    }
    
    private func getLogin()->String {
        //imagine conneting to DB
        return "alisa"
    }
    
    private func getPassword()->String {
        //imagine conneting to DB
        return "password"
    }
    
    @objc func verifyPasswordForEntrance() {
        let inputLogin = authorizationWindow.getLoginTextField()
        let inputPassword = authorizationWindow.getPasswordTextField()
        if getLogin() == inputLogin &&  getPassword() == inputPassword {
            authorizationWindow.presentMainMenu()
        }
    }
    
    func verifyPassword(login: String, password: String)-> Bool {
        if getLogin() == login &&  getPassword() == password {
            return true
        } else {
            return false
        }
    }
}

