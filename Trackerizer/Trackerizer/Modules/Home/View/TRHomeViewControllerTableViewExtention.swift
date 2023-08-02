//
//  TRHomeViewControllerTableViewExtention.swift
//  Trackerizer
//
//  Created by Kishor LD on 26/06/23.
//

import Foundation
import UIKit
 
extension TRHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNoOfRows(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? TRHomeTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.getData()
        let dataSource = segmentControl.selectedSegmentIndex == 0 ? data[0].data : data[1].data
        cell.configure(image: dataSource[indexPath.row].image, iconText: dataSource[indexPath.row].category, iconCost: dataSource[indexPath.row].price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
