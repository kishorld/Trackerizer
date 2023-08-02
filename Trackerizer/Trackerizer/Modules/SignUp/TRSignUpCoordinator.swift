//
//  TRRegister2Coordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 14/06/23.
//

import Foundation
import UIKit
class TRSignUpCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    init (with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let trSignUpVC = TRSignUpViewController()
        trSignUpVC.trSignUpCoordinator = self
        self.navigationController.pushViewController(trSignUpVC, animated: true)
    }
    
    func navigateToSignIn() {
        let signInCoordinator = TRSignInCoordinator(with: navigationController)

        childCoordinators.append(signInCoordinator)
        signInCoordinator.start()
    }
    
}
