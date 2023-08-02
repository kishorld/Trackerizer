//
//  TRSignInCoordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 17/06/23.
//

import Foundation
import UIKit
class TRSignInCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    init (with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let trSignIn = TRSignInViewController()
        trSignIn.trSignInCoordinator = self
        self.navigationController.pushViewController(trSignIn, animated: true)
    }
    
    func navigateToHomeVc() {
//        let homeVc = TRHomeCoordinator(with: navigationController)
//        homeVc.start()
        let home = CustomTabBarController()
        self.navigationController.pushViewController(home, animated: true)
    }
    
    func navigateTpSignUp() {
        let signUpVc = TRSignUpCoordinator(with: navigationController)
        childCoordinators.append(signUpVc)
        signUpVc.start()
    }
    
}
