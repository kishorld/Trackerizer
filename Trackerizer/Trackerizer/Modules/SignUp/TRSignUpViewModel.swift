//
//  TRSignUpViewModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 20/06/23.
//

import Foundation
import UIKit

protocol SignUpDelegate: AnyObject {
    func getSigUpData(data: RegistrationResponseModel)
}

class TRSignUpViewModel {
    
    weak var  delegate: SignUpDelegate?
    func performSignUp(register: RegistrationRequestModel) {
        ApiManager.sharedInstance.callRegisterApiForSignUp(registerRequestModel: register) {data , err in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(RegistrationResponseModel.self, from:data)
//                    print(decodedData)
                    self.delegate?.getSigUpData(data: decodedData)
                    } catch {
                     print("error in decoding")
                 }
            } catch {
                print("error")
            }
            
        }
    }
    
    func validatePasswordAnimation(firstProgressView: UIView,secondProgressView: UIView, thirdProgressView: UIView,fourthProgressView: UIView, password: NSString, passwordLength: Int ) {
        
        if password.validPassword() {
            print(password)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = .orange
            thirdProgressView.backgroundColor = .yellow
            fourthProgressView.backgroundColor = .green
        } else if (1..<3).contains(passwordLength) {
            print(password)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            thirdProgressView.backgroundColor =  TrackerizerColorAssests.Buttongrey.color
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        } else if (3..<5).contains(passwordLength) {
            print(password)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = .orange
            thirdProgressView.backgroundColor =  TrackerizerColorAssests.Buttongrey.color
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        } else if (5..<55).contains(passwordLength) {
            print(password)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = .orange
            thirdProgressView.backgroundColor = .yellow
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        } else {
            print(password)
            firstProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            secondProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            thirdProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        }
        
    }
}

