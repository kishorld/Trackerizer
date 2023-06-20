//
//  TRRegister2Coordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 14/06/23.
//

import Foundation
import UIKit
class TRSignUpCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    init (with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let trSignUpVC = TRSignUpViewController()
        trSignUpVC.trSignUpCoordinator = self
        self.navigationController.pushViewController(trSignUpVC, animated: true)
    }
    
}
