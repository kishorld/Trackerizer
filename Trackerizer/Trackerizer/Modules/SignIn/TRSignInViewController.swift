//
//  TRSignInViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 17/06/23.
//

import UIKit

class TRSignInViewController: UIViewController {

    weak var trSignInCoordinator: TRSignInCoordinator?
    var isButtonSelected = false
    private let viewModel = TRSignInViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
        emailTextFeild.delegate = self
        passwordTextFeild.delegate = self
        viewModel.delegate = self
        emailTextFeild.tag = 0
    }
    
    let activityIndicator : UIActivityIndicatorView = {
        let  indicator = UIActivityIndicatorView()
        indicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        indicator.color = TrackerizerColorAssests.textGrey.color
        return indicator
    }()
    
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
        let label = IOComponent.createLabel(text: TracerizerConstants.login,textColor: TrackerizerColorAssests.textGrey.color)
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
        let label = IOComponent.createLabel(text: TracerizerConstants.password,textColor: TrackerizerColorAssests.textGrey.color)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        return label
    }()
    
    let passwordTextFeild: UITextField = {
        let textBox = TRCustomTextFeild()
        textBox.returnKeyType = UIReturnKeyType.go
        return textBox
    }()
    
    let checkBoxButton: UIButton = {
        let button  = UIButton()
            button.layer.borderColor = TrackerizerColorAssests.Buttongrey.color.cgColor
            button.layer.borderWidth = 2
            button.layer.cornerRadius =  6
        button.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        return button
    }()
    
    let rememberLabel: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.rememberMe,textColor: TrackerizerColorAssests.textGrey.color)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 14)
        return label
    }()
    
    let forgotPassword: UIButton = {
        let button  = IOComponent.createTitleButton(title: TracerizerConstants.forgotPassword, titleColor: TrackerizerColorAssests.textGrey.color)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 14)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    let remembermeStackview: UIStackView = {
        let stackk = IOComponent.createStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 8)
        return stackk
    }()
    
    let secondaryStackview: UIStackView = {
        let stackk = IOComponent.createStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 66)
        return stackk
    }()
    
    let signAndRemeberStackbuttonStack: UIStackView = {
        let stackk = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 28)
        return stackk
    }()
    
    let signInButton: UIButton = {
        let button = IOComponent.createTitleButton(title: TracerizerConstants.signIn, titleColor: .white)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        button.backgroundColor = TrackerizerColorAssests.ButtonOrange.color
        button.layer.cornerRadius = 24
        button.layer.shadowColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = IOComponent.createTitleButton(title: TracerizerConstants.signUp, titleColor: .white)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        button.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        return button
    }()
    
    let dontHaveAccount: UILabel = {
        let label = IOComponent.createLabel(text: TracerizerConstants.dontHaveAccounnt, textColor: .white)
        label.textAlignment = .center
        label.font = UIFont(name: TrackerizerFontAssests.interRegular.font, size: 14)
        return label
    }()
    
    let bottomButtonStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 20)
        return stack
    }()
    
    @objc func checkBoxTapped(sender: UIButton) {
        isButtonSelected = !isButtonSelected
        if isButtonSelected {
            checkBoxButton.setImage(TrackerizerImageAssests.checkMark.image, for: .normal)
        } else {
            checkBoxButton.setImage(nil, for: .normal)
        }
    }
    
    @objc func signInButtonTapped() {
        activityIndicator.startAnimating()
        guard let email = emailTextFeild.text else {return}
        guard let password = passwordTextFeild.text else {return}
        viewModel.performSignIn(signInData: TRSignInRequestModel(login: email, password: password))
    }
    
    @objc func goToSignUp() {
        trSignInCoordinator?.navigateTpSignUp()
    }
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        self.navigationController?.isNavigationBarHidden = true
        buildHeirachy()
        buildConstraints()
    }
    
    func buildHeirachy() {
        view.addSubview(logoView)
        view.addSubview(emailAndPasswordStack)
        view.addSubview(signAndRemeberStackbuttonStack)
        view.addSubview(bottomButtonStack)
        view.addSubview(activityIndicator)
        emailStackview.addArrangedSubview(emailLabel)
        emailStackview.addArrangedSubview(emailTextFeild)
        passwordStackview.addArrangedSubview(passwordLabel)
        passwordStackview.addArrangedSubview(passwordTextFeild)
        emailAndPasswordStack.addArrangedSubview(emailStackview)
        emailAndPasswordStack.addArrangedSubview(passwordStackview)
        remembermeStackview.addArrangedSubview(checkBoxButton)
        remembermeStackview.addArrangedSubview(rememberLabel)
        secondaryStackview.addArrangedSubview(remembermeStackview)
        secondaryStackview.addArrangedSubview(forgotPassword)
        signAndRemeberStackbuttonStack.addArrangedSubview(secondaryStackview)
        signAndRemeberStackbuttonStack.addArrangedSubview(signInButton)
        bottomButtonStack.addArrangedSubview(dontHaveAccount)
        bottomButtonStack.addArrangedSubview(signUpButton)
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
        signAndRemeberStackbuttonStack.constrain(.topAnchor,to: emailAndPasswordStack.bottomAnchor, constant: 20)
        signAndRemeberStackbuttonStack.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 25))
        rememberLabel.constrain(.heightAnchor, constant: 20)
        rememberLabel.constrain(.widthAnchor, constant: 100)
        checkBoxButton.constrain(.heightAnchor, constant: 20)
        checkBoxButton.constrain(.widthAnchor, constant: 20)
        forgotPassword.constrain(.heightAnchor, constant: 20)
        signInButton.constrain(.heightAnchor, constant: 48)
        dontHaveAccount.constrain(.heightAnchor, constant: 20)
        signUpButton.constrain(.heightAnchor, constant: 48)
        bottomButtonStack.constrain(.bottomAnchor,to: view.bottomAnchor, constant: -30)
        bottomButtonStack.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 25))
        activityIndicator.constrain(.centerXAnchor, to: view.centerXAnchor)
        activityIndicator.constrain(.centerYAnchor, to: view.centerYAnchor)
        
    }

}

extension TRSignInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextFeild {
           emailTextFeild.resignFirstResponder()
           passwordTextFeild.becomeFirstResponder()
        } else if textField == passwordTextFeild {
            passwordTextFeild.resignFirstResponder()
            signInButtonTapped()
            //TODO :- implement sign in button action if password and email validates
        }
       return true
      }
}

extension TRSignInViewController: SignInDelegate {
   
    func getSigInData(data: TRSignInResponseModel) {
        activityIndicator.stopAnimating()
        if data.code != nil {
            showAlert(title: TRSignUpConstants.alertTitle, message: data.message ?? "")
        } else {
            let alert = UIAlertController(title: TRSignUpConstants.alertTitle, message: "Logged In successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.trSignInCoordinator?.navigateToHomeVc()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
