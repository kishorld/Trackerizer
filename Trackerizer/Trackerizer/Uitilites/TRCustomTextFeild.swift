//
//  TRCustomTextFeild.swift
//  Trackerizer
//
//  Created by Kishor LD on 18/06/23.
//

import UIKit

class TRCustomTextFeild: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func build() {
        font = UIFont.systemFont(ofSize: 15)
        textColor = .white
        autocorrectionType = UITextAutocorrectionType.no
        clearButtonMode = UITextField.ViewMode.whileEditing
        layer.borderColor = TrackerizerColorAssests.Buttongrey.color.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 12
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftViewMode = .always
    }
}
