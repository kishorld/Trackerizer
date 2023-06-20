//
//  TRRegister2ViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 14/06/23.
//

import UIKit

class TRSignUpViewController: UIViewController {
    
    weak var trSignUpCoordinator: TRSignUpCoordinator?
    private let viewModel  = TRSignUpViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.navigationController?.isNavigationBarHidden = true
        passwordTextFeild.delegate = self
        build()
    }
    
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        buildHeirachy()
        buildConstraints()
    }
    
    let logoView: UIView = {
        let logo = LogoImageView()
        return logo
    }()
    
    let emailAndPasswordStack: UIStackView = {
        let stackk = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 15)
        return stackk
    }()
    
    let emailStackview: UIStackView = {
        let stackk = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 8)
        return stackk
    }()
    
    let emailLabel: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.emailAddress,textColor: TrackerizerColorAssests.textGrey.color)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        return label
    }()
    
    let emailTextFeild: UITextField = {
        let textBox = TRCustomTextFeild()
        textBox.keyboardType = UIKeyboardType.emailAddress
        textBox.returnKeyType = .next
        return textBox
    }()
    
    let passwordStackview: UIStackView = {
        let stackk = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 8)
        return stackk
    }()
    
    let passwordLabel: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.password, textColor: TrackerizerColorAssests.textGrey.color)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        return label
    }()
    
    let passwordTextFeild: UITextField = {
        let textBox = TRCustomTextFeild()
        textBox.returnKeyType = UIReturnKeyType.go
        return textBox
    }()
    
    let signInButton: UIButton = {
        let button = IOComponent.createTitleButton(title: TracerizerConstants.signIn, titleColor: .white)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        button.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        button.layer.cornerRadius = 24
        //        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        return button
    }()
    
    let dontHaveAccount: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.doHaveAccount, textColor: .white)
        label.textAlignment = .center
        label.font = UIFont(name: TrackerizerFontAssests.interRegular.font, size: 14)
        return label
    }()
    
    let bottomButtonStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 20)
        return stack
    }()
    
    let signUpButton: UIButton = {
        let button = IOComponent.createTitleButton(title: TracerizerConstants.getStartedFree, titleColor: .white)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        button.backgroundColor = TrackerizerColorAssests.ButtonOrange.color
        button.layer.cornerRadius = 24
        button.layer.shadowColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
//        button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
//        button.addTarget(self, action: #selector(goToRegister1), for: .touchUpInside)
        return button
    }()
    
    let firstProgressView: UIView = {
        let  view = UIView()
        view.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        view.constrain(.heightAnchor, constant: 5)
        view.clipsToBounds = true
        view.layer.cornerRadius = 2.5
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        return view
    }()
    
    let secondProgressView: UIView = {
        let  view = UIView()
        view.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        view.constrain(.heightAnchor, constant: 5)
        return view
    }()
    
    let thirdProgressView: UIView = {
        let  view = UIView()
        view.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        view.constrain(.heightAnchor, constant: 5)
        return view
    }()
    
    let fourthProgressView: UIView = {
        let  view = UIView()
        view.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        view.constrain(.heightAnchor, constant: 5)
        view.clipsToBounds = true
        view.layer.cornerRadius = 2.5
        view.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        return view
    }()
    
    let progressStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 5)
        return stack
    }()
    
    let passwordSuggestionlabel: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.passwordSugesstionLabel, textColor: TrackerizerColorAssests.textGrey.color)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
//        label.textAlignment = .left
        return label
    }()
    
    func buildHeirachy() {
        view.addSubview(logoView)
        view.addSubview(emailAndPasswordStack)
        view.addSubview(bottomButtonStack)
        view.addSubview(signUpButton)
        view.addSubview(progressStack)
        view.addSubview(passwordSuggestionlabel)
        emailStackview.addArrangedSubview(emailLabel)
        emailStackview.addArrangedSubview(emailTextFeild)
        passwordStackview.addArrangedSubview(passwordLabel)
        passwordStackview.addArrangedSubview(passwordTextFeild)
        emailAndPasswordStack.addArrangedSubview(emailStackview)
        emailAndPasswordStack.addArrangedSubview(passwordStackview)
        bottomButtonStack.addArrangedSubview(dontHaveAccount)
        bottomButtonStack.addArrangedSubview(signInButton)
        progressStack.addArrangedSubview(firstProgressView)
        progressStack.addArrangedSubview(secondProgressView)
        progressStack.addArrangedSubview(thirdProgressView)
        progressStack.addArrangedSubview(fourthProgressView)
    }
        
        func buildConstraints() {
            logoView.constrain(.centerXAnchor, to: view.centerXAnchor)
            logoView.constrain(.topAnchor,to: view.topAnchor, constant: 60)
            emailAndPasswordStack.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
            emailAndPasswordStack.constrain(.topAnchor,to: logoView.bottomAnchor, constant: view.frame.height * 0.17)
            emailTextFeild.constrain(.heightAnchor, constant: 48)
            emailLabel.constrain(.heightAnchor, constant: 16)
            passwordTextFeild.constrain(.heightAnchor, constant: 48)
            passwordLabel.constrain(.heightAnchor, constant: 16)
            dontHaveAccount.constrain(.heightAnchor, constant: 20)
            signInButton.constrain(.heightAnchor, constant: 48)
            bottomButtonStack.constrain(.bottomAnchor,to: view.bottomAnchor, constant: -30)
            bottomButtonStack.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 25))
            progressStack.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
            progressStack.constrain(below: emailAndPasswordStack, offset: 20)
            passwordSuggestionlabel.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
            passwordSuggestionlabel.constrain(below: progressStack, offset: 16)
            signUpButton.constrain(.heightAnchor, constant: 48)
            signUpButton.constrain(below: passwordSuggestionlabel,offset: 40)
            signUpButton.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        }
}

extension TRSignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let password: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        viewModel.validatePasswordAnimation(firstProgressView: firstProgressView, secondProgressView: secondProgressView, thirdProgressView: thirdProgressView, fourthProgressView: fourthProgressView, password: password, passwordLength: password.length)
        return true
    }

}
