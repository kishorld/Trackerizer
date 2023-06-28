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
        return viewModel.getNoOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! TRHomeTableViewCell
        let dataSource = segmentControl.selectedSegmentIndex == 0 ? TracerizerConstants.yourSubsCellData : TracerizerConstants.upcomingCellData
           let rowData = dataSource[indexPath.row]
           cell.configure(data: rowData[0] as! UIImage, iconText: rowData[1] as! String, iconCost: rowData[2] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
