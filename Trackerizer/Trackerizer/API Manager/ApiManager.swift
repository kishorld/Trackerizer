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
