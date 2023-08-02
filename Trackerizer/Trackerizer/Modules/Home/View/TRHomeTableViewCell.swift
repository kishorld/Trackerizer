//
//  TRHomeTableViewCell.swift
//  Trackerizer
//
//  Created by Kishor LD on 26/06/23.
//

import UIKit

class TRHomeTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func didMoveToSuperview() {
         selectionStyle = .none
     }
    
    func build() {
        buildHeirarchy()
        buildConstraints()
        backgroundColor = TrackerizerColorAssests.AppBackGround.color
    }
    
    private let containerView: UIView = {
        let view = UIView()
            view.layer.borderColor = TrackerizerColorAssests.GreyScale.color.cgColor
            view.layer.borderWidth = 01
            view.layer.cornerRadius = 16
        view.constrain(.heightAnchor, constant: 60)
        return  view
    }()
    
    private lazy var IconImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.facebookIcon.image, contentMode: .scaleToFill)
        return image
    }()
    
    private lazy var IconLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interBold.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var IconCostLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interBold.font, size: 14)
        label.textAlignment = .right
        return label
    }()
    
    func configure(image: String, iconText: String, iconCost: String) {
        IconImage.image = UIImage(named: image)
        IconLabel.text = iconText
        IconCostLabel.text = iconCost
    }
    
    func buildHeirarchy() {
        addSubview(containerView)
        containerView.addSubview(IconImage)
        containerView.addSubview(IconLabel)
        containerView.addSubview(IconCostLabel)
    }
    
    func buildConstraints() {
        containerView.constrainEdges(.vertical, with: .init(topAndBottom: 10))
        containerView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        IconLabel.constrain(.centerYAnchor, to:containerView.centerYAnchor)
        IconImage.constrain(.centerYAnchor, to: containerView.centerYAnchor)
        IconCostLabel.constrain(.centerYAnchor, to: containerView.centerYAnchor)
        IconImage.constrain(.leadingAnchor, to: leadingAnchor,constant: 12)
        IconLabel.constrain(.leadingAnchor, to: IconImage.trailingAnchor, constant: 15)
        IconCostLabel.constrain(.trailingAnchor, to: trailingAnchor, constant: -17)
        IconImage.constrain(.height, constant: 40)
        IconImage.constrain(.width, constant: 40)
    }
}
