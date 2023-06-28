//
//  TRSignInModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 23/06/23.
//

import Foundation

struct TRSignInRequestModel: Codable {
    let login: String
    let password: String
}

struct TRSignInResponseModel:Decodable {
    let code: Int?
    let message: String?
    let email: String?
}
