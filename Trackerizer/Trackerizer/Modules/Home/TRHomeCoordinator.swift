//
//  TRHomeCoordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 19/06/23.
//

import Foundation
import UIKit
class TRHomeCoordinator {
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    init (with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let trHomeVc = TRHomeViewController()
        trHomeVc.trHomeCoordinator = self
        self.navigationController.pushViewController(trHomeVc, animated: true)
    }
}
