//
//  DataInfoTableViewCell.swift
//  Trackerizer
//
//  Created by Kishor LD on 17/07/23.
//

import UIKit

class TRDataInfoTableViewCell: UITableViewCell {

    
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
        view.backgroundColor = TrackerizerColorAssests.greyScale50.color
            view.layer.borderColor = TrackerizerColorAssests.greyScale30.color.cgColor
        view.layer.borderWidth = 0.5
            view.layer.cornerRadius = 21
        view.constrain(.heightAnchor, constant: 84)
        return  view
    }()
    
    private lazy var IconImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.facebookIcon.image, contentMode: .scaleToFill)
        return image
    }()
    
    private lazy var IconLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var IconCostLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
//        label.textAlignment = .right
        return label
    }()
    
    private lazy var IconCostDescLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.greyScale30.color)
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var IconDescLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.greyScale30.color)
            label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
//            label.textAlignment = .right
        return label
    }()
    
    private let costStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 2)
        return stack
    }()
    
    private let iconStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 2)
        return stack
    }()
    
    private let progressLine: UIProgressView = {
        let progresLine = UIProgressView(progressViewStyle: .bar)
        progresLine.setProgress(0.5, animated: true)
        progresLine.trackTintColor = TrackerizerColorAssests.dottedGreyScale60.color
        progresLine.tintColor = UIColor.red
        return progresLine
    }()
    
    func configure(image: String, iconText: String, iconCost: String, icontextDesc: String, iconCostDesc:String, ProgressColor: String, progressValue: Double) {
        IconImage.image = UIImage(named: image)
        IconLabel.text = iconText
        IconCostLabel.text = iconCost
        IconDescLabel.text = icontextDesc
        IconCostDescLabel.text =  iconCostDesc
        progressLine.setProgress(Float(progressValue), animated: true)
        progressLine.tintColor = UIColor(named: ProgressColor)
        }
    
    func buildHeirarchy() {
        addSubview(containerView)
        containerView.addSubview(IconImage)
        containerView.addSubview(iconStack)
        containerView.addSubview(costStack)
        containerView.addSubview(progressLine)
        iconStack.addArrangedSubview(IconLabel)
        iconStack.addArrangedSubview(IconDescLabel)
        costStack.addArrangedSubview(IconCostLabel)
        costStack.addArrangedSubview(IconCostDescLabel)
    }
    
    func buildConstraints() {
        containerView.constrainEdges(.vertical, with: .init(topAndBottom: 8))
        containerView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        IconImage.constrain(.topAnchor, to: containerView.topAnchor,constant: 20)
        IconImage.constrain(.leadingAnchor, to: containerView.leadingAnchor,constant: 20)
        IconImage.constrain(.height, constant: 24)
        IconImage.constrain(.width, constant: 24)
        iconStack.constrain(.topAnchor, to: containerView.topAnchor,constant: 16)
        iconStack.constrain(.leadingAnchor, to: IconImage.trailingAnchor,constant: 24)
        costStack.constrain(.topAnchor, to: containerView.topAnchor,constant: 16)
        costStack.constrain(.trailingAnchor, to: containerView.trailingAnchor,constant: -16)
        progressLine.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        progressLine.constrain(.bottomAnchor, to: containerView.bottomAnchor, constant: -11)
        
        
    }

}
