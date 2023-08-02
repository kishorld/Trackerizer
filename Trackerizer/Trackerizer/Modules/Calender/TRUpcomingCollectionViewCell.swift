//
//  UpcomingCollectionViewCell.swift
//  Trackerizer
//
//  Created by Kishor LD on 19/07/23.
//

import UIKit

class TRUpcomingCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = TrackerizerColorAssests.greyScale50.color
       layer.shadowColor = TrackerizerColorAssests.ButtonBlack.color.cgColor
       layer.shadowOpacity = 0.5
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
    
    private let subsLabel: UILabel = {
        let label = IOComponent.createLabel(text: "Spotify", textColor: TrackerizerColorAssests.ButonWhite.color, numberOfLines: 0)
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        return label
    }()
    
    private let subsCostLabel: UILabel = {
        let label = IOComponent.createLabel(text: "$5.99", textColor: TrackerizerColorAssests.ButonWhite.color, numberOfLines: 0)
        label.font = UIFont(name: TrackerizerFontAssests.interBold.font, size: 20)
        return label
    }()
    
    private lazy var IconImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.facebookIcon.image, contentMode: .scaleToFill)
        return image
    }()
        
    let stackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 5)
        return stack
    }()
    
    func buildHeirarchy() {
        contentView.addSubview(IconImage)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(subsLabel)
        stackView.addArrangedSubview(subsCostLabel)
    }
    func buildConstraints() {
        stackView.constrain(.leadingAnchor, to: contentView.leadingAnchor,constant: 16)
        stackView.constrain(.bottomAnchor, to: contentView.bottomAnchor, constant: -11)
        IconImage.constrain(.leadingAnchor, to: contentView.leadingAnchor,constant: 16)
        IconImage.constrain(.topAnchor, to: contentView.topAnchor, constant: 16)
    }
    
    func config(iconImage:String, subsText: String, subscostText: String) {
        IconImage.image = UIImage(named: iconImage)
        subsLabel.text = subsText
        subsCostLabel.text = subscostText
    }
}
