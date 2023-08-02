//
//  TRSpendingAndBudgetViewModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 02/08/23.
//

import Foundation


class TRSpendingAndBudgetViewModel {
    var data: [SpeendingAndBudgetData]?
    
    func getSpendingAndBudgetData() {
        data  = ApiManager.sharedInstance.fetchLocalJSONData(forResource: "SpendingAndBudgetData", ofType: "json")
    }
    
    func getNoOfcell() -> Int {
        if let data = data?.count {
            return data
        } else {
            return 0
        }
    }
    
    func getData() -> [SpeendingAndBudgetData] {
        if let data = data {
            return data
        } else {
            return []
        }
    }
}
