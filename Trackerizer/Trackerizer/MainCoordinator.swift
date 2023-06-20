//
//  MainCoordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 13/06/23.
//

import Foundation
import UIKit
class MainCoordinator : Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    init (with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let welcomeCoordinator = TRWelcomeCoordinator(with: navigationController)
        childCoordinators.append(welcomeCoordinator)
        welcomeCoordinator.start()
    }
}
