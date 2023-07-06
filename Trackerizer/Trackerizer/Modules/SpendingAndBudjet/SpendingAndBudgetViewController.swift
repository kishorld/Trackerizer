//
//  SpendingAndBudgetViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 27/06/23.
//

import UIKit

class SpendingAndBudgetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    
    
    
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        buildHeirarchy()
        buildConstraints()
    }

    
    private let settingButtton: UIButton = {
        let btn = IOComponent.createCustomButton(image:TrackerizerImageAssests.setting.image)
        return btn
    }()
    
    func buildHeirarchy() {
        view.addSubview(settingButtton)
    }
    
    func buildConstraints()  {
        settingButtton.constrainSize(width: 24, height: 24)
        settingButtton.constrain(.topAnchor,to: view.topAnchor, constant: 50)
        settingButtton.constrain(.trailingAnchor,to: view.trailingAnchor, constant: -25)
    }
}
