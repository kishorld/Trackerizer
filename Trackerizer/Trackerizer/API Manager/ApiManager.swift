//
//  ApiManager.swift
//  Trackerizer
//
//  Created by Kishor LD on 21/06/23.
//

import Foundation
import Alamofire

class ApiManager {
    static let sharedInstance = ApiManager()

    func callRegisterApiForSignUp(registerRequestModel: RegistrationRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
        let header: HTTPHeaders = [.contentType("application/json")]
        print(registraionUrl)
        AF.request(registraionUrl, method: .post, parameters: registerRequestModel, encoder: JSONParameterEncoder.default, headers: header).response {
            response in
            switch response.result {
            case.success(let data):
                completionHandler(data, nil)
            case .failure(let err):
                completionHandler(nil, err)
                print(err.localizedDescription)
            }
        }
    }
    
    func callSignInApi(signinRequestModel: TRSignInRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
        let header: HTTPHeaders = [.contentType("application/json")]
        print(signInUrl)
        AF.request(signInUrl,method: .post, parameters: signinRequestModel, encoder: JSONParameterEncoder.default,headers: header).response {
            response in
            switch response.result  {
            case.success(let data):
                completionHandler(data, nil)
            case .failure(let err):
                print()
                completionHandler(nil, err)
            }
        }
    }
}
