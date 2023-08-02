//
//  ViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 12/06/23.
//

import UIKit
import YCoreUI

class TRWelcomeScreenViewController: UIViewController {
    
    weak var trwelcomeCoordinator: TRWelcomeCoordinator?
    //    var childCoordinator: [Coordinator] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    
    let logoView: UIView = {
        let  logo = LogoImageView()
        return logo
    }()
    
    let leadingStyleImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.leadingStyleIcon.image , contentMode: .scaleAspectFit)
        return image
    }()
    
    let trailingStyleImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.trailingStyleIcon.image , contentMode: .scaleAspectFill)
        return image
    }()
    
    let iconsImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.Frameonboarding.image , contentMode: .scaleAspectFit)
        return image
    }()
    
    let buttonStack: UIStackView = {
        let  stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 16)
        return stack
    }()
    
    let getStartedButton: UIButton = {
        let button = IOComponent.createTitleButton(title: TracerizerConstants.getStarted, titleColor: .white)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        button.backgroundColor = TrackerizerColorAssests.ButtonOrange.color
        button.layer.cornerRadius = 24
        button.layer.shadowColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 24
        button.layer.shadowOffset = CGSize(width: 0, height: 10)
        return button
    }()
    
    let accountButton: UIButton = {
        let button = IOComponent.createTitleButton( title: TracerizerConstants.iHaveAnAcconut, titleColor: .white)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        button.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
        return button
    }()
    
    let desccriptionabel: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.weclomeScreenDescription, textColor: .white)
        label.font = UIFont(name: TrackerizerFontAssests.interRegular.font, size: 14)
        label.textAlignment = .center
        return label
    }()
    
    
    func build() {
        initialSetup()
        buildHeirarchy()
        buildConstraints()
    }
    
    
    
    func initialSetup() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        getStartedButton.addTarget(self, action: #selector(goToRegister1), for: .touchUpInside)
    }
    func buildConstraints() {
        buildLogoConstraints()
        buildEdgeStyleConstrains()
        buildIconImageContraints()
        buttonStackConstraints()
    }
    
    func buildHeirarchy() {
        view.addSubview(logoView)
        view.addSubview(leadingStyleImage)
        view.addSubview(trailingStyleImage)
        view.addSubview(iconsImage)
        view.addSubview(buttonStack)
        buttonStack.addArrangedSubview(getStartedButton)
        buttonStack.addArrangedSubview(accountButton)
        view.addSubview(desccriptionabel)
        
    }
    
    func buildLogoConstraints() {
        logoView.constrain(.centerXAnchor, to: view.centerXAnchor)
        logoView.constrain(.topAnchor, to: view.topAnchor,constant: 60)
    }
    
    func buildEdgeStyleConstrains() {
        leadingStyleImage.constrain(.leadingAnchor, to: view.leadingAnchor, constant: 0)
        leadingStyleImage.constrain(.topAnchor, to: view.topAnchor, constant: 120)
        leadingStyleImage.constrain(.heightAnchor, constant: 288)
        leadingStyleImage.constrain(.widthAnchor, constant: 60)
        trailingStyleImage.constrain(.trailingAnchor, to: view.trailingAnchor, constant: 0)
        trailingStyleImage.constrain(.bottomAnchor, to: view.bottomAnchor, constant: -100)
        trailingStyleImage.constrain(.heightAnchor, constant: 250)
        trailingStyleImage.constrain(.widthAnchor, constant: 120)
    }
    
    func buildIconImageContraints() {
        iconsImage.constrain(.heightAnchor, constant: view.frame.height/2)
        iconsImage.constrain(.widthAnchor, constant: view.frame.width - 100)
        iconsImage.constrain(.centerXAnchor, to: view.centerXAnchor)
        iconsImage.constrain(.topAnchor, to: logoView.bottomAnchor, constant: 65)
    }
    
    func buttonStackConstraints() {
        buttonStack.constrain(.leadingAnchor, to: view.leadingAnchor, constant: 25)
        buttonStack.constrain(.trailingAnchor, to: view.trailingAnchor, constant: -25)
        buttonStack.constrain(.bottomAnchor, to: view.bottomAnchor, constant: -30)
        getStartedButton.constrain(.heightAnchor, constant: 48)
        accountButton.constrain(.heightAnchor, constant: 48)
        
        desccriptionabel.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 42))
        desccriptionabel.constrain(.bottomAnchor, to: buttonStack.topAnchor, constant: -20)
        
    }
    
    @objc func goToRegister1() {
        trwelcomeCoordinator?.navigateToRegister1Vc()
    }
    
    @objc func goToSignIn() {
        trwelcomeCoordinator?.navigateToSignIn()
    }
    
}

////
//extension UIButton {
//    func letsAttributes() {
//        self.layer.cornerRadius = 24
//        self.layer.shadowColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
//        self.layer.shadowOpacity = 0.3
////        self.layer.shadowRadius = 24
//        self.layer.shadowOffset = CGSize(width: 0, height: 4)
////        self.layer.borderWidth = 1.0
//        self.layer.cornerRadius = 24
//        self.layer.shadowColor = UIColor(named: "Color")?.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 10)
//
////        self.layer.shadowOpacity = 0.1
////        self.layer.shadowRadius = 100
//        self.layer.masksToBounds = false
//
//    }
//}
