//
//  HomeDataModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 02/08/23.
//

import Foundation


struct HomeData: Decodable {
    let section: String
    let data: [CellData]
}

struct CellData: Decodable {
    let image, category, price: String
}
