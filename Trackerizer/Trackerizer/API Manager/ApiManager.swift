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
    
    func callApi<T: Encodable>(url: String, method: HTTPMethod, parameters: T, completionHandler: @escaping (Data?, Error?) -> Void) {
        let header: HTTPHeaders = [.contentType("application/json")]
        print(url)
        
        AF.request(url, method: method, parameters: parameters, encoder: JSONParameterEncoder.default, headers: header).response { response in
            switch response.result {
            case .success(let data):
                completionHandler(data, nil)
            case .failure(let error):
                completionHandler(nil, error)
                print(error.localizedDescription)
            }
        }
    }

//    func callRegisterApiForSignUp(registerRequestModel: RegistrationRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
//        let header: HTTPHeaders = [.contentType("application/json")]
//        print(registraionUrl)
//        AF.request(registraionUrl, method: .post, parameters: registerRequestModel, encoder: JSONParameterEncoder.default, headers: header).response {
//            response in
//            switch response.result {
//            case.success(let data):
//                completionHandler(data, nil)
//            case .failure(let err):
//                completionHandler(nil, err)
//                print(err.localizedDescription)
//            }
//        }
////    }
////
//    func callSignInApi(signinRequestModel: TRSignInRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
//        let header: HTTPHeaders = [.contentType("application/json")]
//        print(signInUrl)
//        AF.request(signInUrl,method: .post, parameters: signinRequestModel, encoder: JSONParameterEncoder.default,headers: header).response {
//            response in
//            switch response.result  {
//            case.success(let data):
//                completionHandler(data, nil)
//            case .failure(let err):
//                print()
//                completionHandler(nil, err)
//            }
//        }
//    }
    
    //    func callRegisterApiForSignUp(registerRequestModel: RegistrationRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
    //        let header: HTTPHeaders = [.contentType("application/json")]
    //        print(registraionUrl)
    //        AF.request(registraionUrl, method: .post, parameters: registerRequestModel, encoder: JSONParameterEncoder.default, headers: header).response {
    //            response in
    //            switch response.result {
    //            case.success(let data):
    //                completionHandler(data, nil)
    //            case .failure(let err):
    //                completionHandler(nil, err)
    //                print(err.localizedDescription)
    //            }
    //        }
    ////    }
    ////
    //    func callSignInApi(signinRequestModel: TRSignInRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
    //        let header: HTTPHeaders = [.contentType("application/json")]
    //        print(signInUrl)
    //        AF.request(signInUrl,method: .post, parameters: signinRequestModel, encoder: JSONParameterEncoder.default,headers: header).response {
    //            response in
    //            switch response.result  {
    //            case.success(let data):
    //                completionHandler(data, nil)
    //            case .failure(let err):
    //                print()
    //                completionHandler(nil, err)
    //            }
    //        }
    //    }
    //    func callRegisterApiForSignUp(registerRequestModel: RegistrationRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
    //        let header: HTTPHeaders = [.contentType("application/json")]
    //        print(registraionUrl)
    //        AF.request(registraionUrl, method: .post, parameters: registerRequestModel, encoder: JSONParameterEncoder.default, headers: header).response {
    //            response in
    //            switch response.result {
    //            case.success(let data):
    //                completionHandler(data, nil)
    //            case .failure(let err):
    //                completionHandler(nil, err)
    //                print(err.localizedDescription)
    //            }
    //        }
    ////    }
    ////
    //    func callSignInApi(signinRequestModel: TRSignInRequestModel, completionHandler: @escaping (Data?, Error?) -> Void) {
    //        let header: HTTPHeaders = [.contentType("application/json")]
    //        print(signInUrl)
    //        AF.request(signInUrl,method: .post, parameters: signinRequestModel, encoder: JSONParameterEncoder.default,headers: header).response {
    //            response in
    //            switch response.result  {
    //            case.success(let data):
    //                completionHandler(data, nil)
    //            case .failure(let err):
    //                print()
    //                completionHandler(nil, err)
    //            }
    //        }
    //    }
    
    
    func fetchLocalJSONData<T: Decodable>(forResource fileName: String, ofType fileType: String) -> [T]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileType) else {
            print("Error: Could not find \(fileName).\(fileType) in bundle.")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let objects = try decoder.decode([T].self, from: data)
            return objects
        } catch {
            print("Error: Could not load data from \(fileName).\(fileType): \(error)")
            return nil
        }
    }
}
