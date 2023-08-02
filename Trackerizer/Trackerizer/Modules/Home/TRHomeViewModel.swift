//
//  TRHomeViewModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 26/06/23.
//

import Foundation

class TRHomeViewModel {
    
    var data: [HomeData]?
    func fecthHomeData() {
        data = ApiManager.sharedInstance.fetchLocalJSONData(forResource: "HomeData", ofType: "json")
    }
    
    
    
    func getNoOfSections() -> Int {
        if let data = data?.count {
            return data
        } else {
            return 0
        }
    }
    
    func getNoOfRows(index: Int) -> Int {
        if index == 0{
            if let data = data?[0].data.count {
                return data
            } else {
                return 0
            }
        } else {
            if let data = data?[1].data.count {
                return data
            } else {
                return 0
            }
        }
    }
    
    func getData() -> [HomeData] {
        if let data = data {
            return data
        } else {
            return []
        }
    }
}
