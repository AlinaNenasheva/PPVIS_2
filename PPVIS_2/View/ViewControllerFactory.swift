//
//  ViewControllerFactory.swift
//  PPVIS_2
//
//  Created by Алина Ненашева on 9.12.20.
//

import Foundation
import UIKit
 
class ViewControllerFactory {
    static func authorizationWindow() -> AuthorizationWindow {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(identifier: String(describing: AuthorizationWindow.self)) as? AuthorizationWindow else {
                fatalError("Unexpected behaviour")
            }
            let verifyer = Verifyer(authorizationWindow: viewController)
            viewController.verifyer = verifyer
            return viewController
    }
}
