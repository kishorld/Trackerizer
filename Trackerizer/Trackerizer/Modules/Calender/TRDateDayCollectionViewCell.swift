//
//  TRDateDayCollectionViewCell.swift
//  Trackerizer
//
//  Created by Kishor LD on 18/07/23.
//

import UIKit

class TRDateDayCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = TrackerizerColorAssests.greyScale50.color
//       layer.cornerRadius = 16
       layer.shadowColor = TrackerizerColorAssests.ButtonBlack.color.cgColor
       layer.shadowOpacity = 0.5
//       layer.shadowRadius = 24
       layer.shadowOffset = CGSize(width: 4, height: 2)
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    func build() {
        buildHeirarchy()
        buildConstraints()
    }
    
    private let dateLabel: UILabel = {
        let label = IOComponent.createLabel(text: "08", textColor: TrackerizerColorAssests.ButonWhite.color, numberOfLines: 0)
        label.font = UIFont(name: TrackerizerFontAssests.interBold.font, size: 20)
        return label
    }()
    
    private let dayLabel: UILabel = {
        let label = IOComponent.createLabel(text: "wed", textColor: TrackerizerColorAssests.greyScale30.color, numberOfLines: 0)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        return label
    }()
    
     let dotView: UIView = {
        let view = IOComponent.createView()
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 1)
        return stack
    }()
    
    func buildHeirarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(dayLabel)
        contentView.addSubview(dotView)
    }
    func buildConstraints() {
        stackView.constrain(.centerXAnchor, to: contentView.centerXAnchor)
        stackView.constrain(.topAnchor, to: contentView.topAnchor, constant: 8)
        dotView.constrain(.centerXAnchor, to: contentView.centerXAnchor)
        dotView.constrain(.bottomAnchor, to: contentView.bottomAnchor, constant: -15)
        dotView.constrainSize(width: 5, height: 5)
    }
    
    func config(dateText: String, dayText: String) {
        dateLabel.text = dateText
        dayLabel.text = String(dayText.prefix(2))
    }
}
