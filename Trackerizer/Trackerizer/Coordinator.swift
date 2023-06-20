//
//  Coordinator.swift
//  Trackerizer
//
//  Created by Kishor LD on 13/06/23.
//

import Foundation
import UIKit
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
//    var childCoordinators : [Coordinator] {get set }
    func start()
}
