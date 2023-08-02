//
//  SignUpModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 21/06/23.
//

import Foundation

struct RegistrationRequestModel:Encodable {
    let email: String
    let password: String
}

struct RegistrationResponseModel:Decodable {
    let code: Int?
    let message: String?
    let email: String?
}
