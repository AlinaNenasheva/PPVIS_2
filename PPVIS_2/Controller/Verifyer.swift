//
//  Verifyer.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation

class Verifyer {
    weak var authorizationWindow: AuthorizationWindow?
    
    init(authorizationWindow: AuthorizationWindow) {
        self.authorizationWindow = authorizationWindow
        execute()
    }
    
    func execute() {
        authorizationWindow?.setSubmitButtonHandler(verifyPasswordForEntrance)
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
    
    func verifyPasswordForEntrance() {
        let inputLogin = authorizationWindow?.getLogin()
        print(inputLogin)
        let inputPassword = authorizationWindow?.getPassword()
        print(inputPassword)
        if getLogin() == inputLogin &&  getPassword() == inputPassword {
            authorizationWindow?.presentMainMenu()
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

