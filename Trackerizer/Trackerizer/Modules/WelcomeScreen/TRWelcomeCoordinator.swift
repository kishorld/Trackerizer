//
//  TCWelcomeCoordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 13/06/23.
//

import Foundation
import UIKit
class TRWelcomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    init (with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let welcomeVC = TRWelcomeScreenViewController()
        welcomeVC.trwelcomeCoordinator = self

        self.navigationController.pushViewController(welcomeVC, animated: true)
    }
    
    func navigateToRegister1Vc() {
       let register1coordinator = TRResiter1Coordinator(with: navigationController)
       childCoordinators.append(register1coordinator)
        register1coordinator.start()
    }
    
    func navigateToSignIn() {
        let signInCoordinator = TRSignInCoordinator(with: navigationController)
        childCoordinators.append(signInCoordinator)
        signInCoordinator.start()
    }
    
}
