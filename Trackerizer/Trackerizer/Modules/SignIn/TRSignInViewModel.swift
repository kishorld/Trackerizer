//
//  TRSignInViewModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 23/06/23.
//

import Foundation
protocol SignInDelegate: AnyObject {
    func getSigInData(data: TRSignInResponseModel)
}
class TRSignInViewModel {
    weak var  delegate: SignInDelegate?
    func performSignIn(signInData: TRSignInRequestModel) {
        ApiManager.sharedInstance.callSignInApi(signinRequestModel: signInData) { data , err in
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data)
//                print(json)
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(TRSignInResponseModel.self, from:data)
//                    print(decodedData)
                    self.delegate?.getSigInData(data: decodedData)
                    } catch {
                     print("error in decoding")
                 }
            } catch {
                print("error")
            }
            
        }
    }
}
