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
        ApiManager.sharedInstance.callApi(url: registraionUrl, method: .post, parameters: register) { data, error in
            guard let data = data else {return}
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(RegistrationResponseModel.self, from:data)
                //                    print(decodedData)
                self.delegate?.getSigUpData(data: decodedData)
            } catch {
                print("error in decoding")
            }
        }
    }
        
        func validatePasswordForwardAnimation(firstProgressView: LineView,secondProgressView: LineView, thirdProgressView: LineView,fourthProgressView: LineView, password: NSString, passwordLength: Int ) {
            var hasAnimated = false
            
            if passwordLength <= 2 {
                secondProgressView.hasFrontAnimated = false
                fourthProgressView.hasFrontAnimated = false
                if !hasAnimated {
                    firstProgressView.addAnimation()
                    hasAnimated = true
                }
            }
            
            if (2..<4).contains(passwordLength) {
                firstProgressView.hasFrontAnimated = false
                thirdProgressView.hasFrontAnimated = false
                hasAnimated = false
                if !hasAnimated {
                    secondProgressView.addAnimation()
                    hasAnimated = true
                }
            }
            
            if (4..<6).contains(passwordLength) {
                firstProgressView.hasFrontAnimated = false
                secondProgressView.hasFrontAnimated = false
                hasAnimated = false
                if !hasAnimated {
                    thirdProgressView.addAnimation()
                    hasAnimated = true
                }
            }
            
            if (7..<55).contains(passwordLength) && password.validPassword() {
                firstProgressView.hasFrontAnimated = false
                secondProgressView.hasFrontAnimated = false
                thirdProgressView.hasFrontAnimated = false
                hasAnimated = false
                if !hasAnimated {
                    fourthProgressView.addAnimation()
                    hasAnimated = true
                }
            }
            
        }
        
        
        
        
        
        
        func validatePasswordBackwardAnimation(firstProgressView: LineView,secondProgressView: LineView, thirdProgressView: LineView,fourthProgressView: LineView, password: NSString, passwordLength: Int ){
            
            var hasAnimated = false
            //        var hasAnimatedBack = false
            
            if (0..<2).contains(passwordLength) {
                secondProgressView.hasBackAnimated = false
                thirdProgressView.hasBackAnimated = false
                fourthProgressView.hasBackAnimated = false
                if !hasAnimated {
                    firstProgressView.removeAnimation()
                    hasAnimated = true
                }
            }
            
            if (2..<4).contains(passwordLength) {
                thirdProgressView.hasBackAnimated = false
                firstProgressView.hasBackAnimated = false
                //            secondProgressView.hasBackAnimated = false
                hasAnimated = false
                if !hasAnimated {
                    secondProgressView.removeAnimation()
                    hasAnimated = true
                }
            }
            
            if (4..<6).contains(passwordLength) {
                fourthProgressView.hasBackAnimated = false
                secondProgressView.hasBackAnimated = false
                hasAnimated = false
                if !hasAnimated {
                    thirdProgressView.removeAnimation()
                    hasAnimated = true
                }
            }
            
            if (6..<55).contains(passwordLength)  {
                
                thirdProgressView.hasBackAnimated = false
                firstProgressView.hasBackAnimated = false
                hasAnimated = false
                if !hasAnimated {
                    fourthProgressView.removeAnimation()
                    hasAnimated = true
                }
                
            }
            
        }
        
    }
