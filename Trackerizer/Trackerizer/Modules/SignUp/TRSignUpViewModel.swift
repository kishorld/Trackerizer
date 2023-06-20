//
//  TRSignUpViewModel.swift
//  Trackerizer
//
//  Created by Kishor LD on 20/06/23.
//

import Foundation
import UIKit

class TRSignUpViewModel {
    
    func validatePasswordAnimation(firstProgressView: UIView,secondProgressView: UIView, thirdProgressView: UIView,fourthProgressView: UIView, password: NSString, passwordLength: Int ) {
        
        if password.validPassword() {
            print(passwordLength)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = .orange
            thirdProgressView.backgroundColor = .yellow
            fourthProgressView.backgroundColor = .green
        } else if (1..<3).contains(passwordLength) {
            print(passwordLength)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            thirdProgressView.backgroundColor =  TrackerizerColorAssests.Buttongrey.color
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        } else if (3..<5).contains(passwordLength) {
            print(passwordLength)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = .orange
            thirdProgressView.backgroundColor =  TrackerizerColorAssests.Buttongrey.color
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        } else if (5..<55).contains(passwordLength) {
            print(passwordLength)
            firstProgressView.backgroundColor = .red
            secondProgressView.backgroundColor = .orange
            thirdProgressView.backgroundColor = .yellow
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        } else {
            print(passwordLength)
            firstProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            secondProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            thirdProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
            fourthProgressView.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        }
        
    }
}

