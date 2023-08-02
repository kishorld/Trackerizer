//
//  TRResiter1Coordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 13/06/23.
//

import Foundation
import UIKit
class TRResiter1Coordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    init (with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let trresgister1VC = TRRegisterViewController()
        trresgister1VC.trRegister1Coordinator = self
        self.navigationController.pushViewController(trresgister1VC, animated: true)
    }
    
    func navigateToSignUpWithEmail() {
        let signUpCoordinator = TRSignUpCoordinator(with: navigationController)
        childCoordinators.append(signUpCoordinator)
        signUpCoordinator.start()
    }
    
    
}
