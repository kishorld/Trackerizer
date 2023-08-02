//
//  TRCreditcardViewModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 01/08/23.
//

import Foundation

class TRCreditcardViewModel {
    var data: [CreditCardData]?
    func fetchCreditCardData() {
        data = ApiManager.sharedInstance.fetchLocalJSONData(forResource: "TRCreditCardData", ofType: "json")
    }
    
    func noOfCards() -> Int {
        if let data = data?.count {
            return data
        } else {
            return 0
        }
    }
    
    func getData() -> [CreditCardData] {
        if let data = data {
            return data
        } else {
            return []
        }
    }
}
