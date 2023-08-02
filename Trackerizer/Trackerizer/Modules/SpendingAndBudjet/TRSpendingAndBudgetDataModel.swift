//
//  TRSpendingAndBudgetDataModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 02/08/23.
//

import Foundation

struct SpeendingAndBudgetData: Codable {
    let image: String
    let category: String
    let price: String
    let remaining: String
    let total: String
    let color: String
    let percentage: Double
}
