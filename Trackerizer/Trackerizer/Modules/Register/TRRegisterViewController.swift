//
//  TRRegister1ViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 13/06/23.
//

import UIKit

class TRRegisterViewController: UIViewController {
    
    weak var trRegister1Coordinator: TRResiter1Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    
    let logoView: UIView = {
        let  logo = LogoImageView()
        return logo
    }()
    
    let topButtonStack: UIStackView = {
        let  stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 16)
        return stack
    }()
    
    let bottomButonStack: UIStackView = {
        let  stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 24)
        return stack
    }()
    
    let mainStack: UIStackView = {
        let  stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 40)
        return stack
    }()
    
    let appleSignUpButton: UIButton = {
        let button = IconCustomButton()
        button.configure(with: buttonProperties(text: TracerizerConstants.appleSignUp, image: TrackerizerImageAssests.appleIcon.image, backgroudcolor: TrackerizerColorAssests.ButtonBlack.color, textcolor: .white))
        return button
    }()
    
    let googleSignUpButton: UIButton = {
        let button = IconCustomButton()
        button.configure(with: buttonProperties(text: TracerizerConstants.googleSignUp, image: TrackerizerImageAssests.googleIcon.image, backgroudcolor: TrackerizerColorAssests.ButonWhite.color, textcolor: .black))
        button.setUpShadow(shadowColor: TrackerizerColorAssests.ButonWhite.color)
        return button
    }()
    
    let faceBookSignUpButton: UIButton = {
        let button  = IconCustomButton()
        button.configure(with: buttonProperties(text: TracerizerConstants.facebookSignUp, image: TrackerizerImageAssests.facebookIcon.image, backgroudcolor: TrackerizerColorAssests.ButtonBlue.color, textcolor: .white))
        button.setUpShadow(shadowColor:TrackerizerColorAssests.ButtonBlue.color)
        return button
    }()
    
    let signUpWithEmailButton: UIButton = {
        let button = IOComponent.createTitleButton( title: TracerizerConstants.emailSignUp, titleColor: .white)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        button.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(goToSignUpWithEmail) , for: .touchUpInside)
        return button
    }()
    
    let termsAndConditionlabel: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.termsAndCondition, textColor: TrackerizerColorAssests.textGrey.color)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        label.textAlignment = .center
        return label
    }()
    
    let orlabel: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.or, textColor: .white)
        label.font = UIFont(name: TrackerizerFontAssests.interRegular.font, size: 14)
        label.textAlignment = .center
        return label
    }()
    
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        self.navigationController?.isNavigationBarHidden = true
        buidHeirarchy()
        buildConstraints()
    }
    
    func buidHeirarchy() {
        view.addSubview(logoView)
        topButtonStack.addArrangedSubview(appleSignUpButton)
        topButtonStack.addArrangedSubview(googleSignUpButton)
        topButtonStack.addArrangedSubview(faceBookSignUpButton)
        bottomButonStack.addArrangedSubview(signUpWithEmailButton)
        bottomButonStack.addArrangedSubview(termsAndConditionlabel)
        mainStack.addArrangedSubview(topButtonStack)
        mainStack.addArrangedSubview(orlabel)
        mainStack.addArrangedSubview(bottomButonStack)
        view.addSubview(mainStack)
    }
    
    func buildConstraints() {
        logoConstraints()
        stackItemConstraints()
    }
    
    func logoConstraints() {
        logoView.constrain(.topAnchor, to: view.topAnchor,constant: 60)
        logoView.constrain(.centerXAnchor, to: view.centerXAnchor)
    }
    
    func stackItemConstraints() {
        mainStack.constrain(.bottomAnchor, to: view.bottomAnchor, constant: -38)
        mainStack.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 25))
        googleSignUpButton.constrain(.heightAnchor, constant: 48)
        faceBookSignUpButton.constrain(.heightAnchor, constant: 48)
        appleSignUpButton.constrain(.heightAnchor, constant: 48)
        termsAndConditionlabel.constrain(.heightAnchor, constant: 32)
        orlabel.constrain(.heightAnchor, constant: 20)
        signUpWithEmailButton.constrain(.heightAnchor, constant: 48)
    }
    
    @objc func goToSignUpWithEmail() {
        trRegister1Coordinator?.navigateToSignUpWithEmail()
    }
    
}
