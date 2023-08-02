//
//  CardCollectionViewCell.swift
//  Trackerizer
//
//  Created by Kishor LD on 24/07/23.
//

import UIKit

class TRCardCollectionViewCell: UICollectionViewCell {
    
    // Add your UI components here to represent the credit card
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = TrackerizerColorAssests.cardColor.color // Customize the card's appearance here
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 20 // Apply corner radius to get rounded corners
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cardNumberLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 16)
        return label
    }()
    
    private let cardHolderNameLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.greyScale30.color)
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 12)
        return label
    }()
    
    private let cardExpireDateLabel: UILabel = {
        let label = IOComponent.createLabel(text: "", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        return label
    }()
    
    private let cardHeadLabel: UILabel = {
        let label = IOComponent.createLabel(text: "Virtual Card", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 16)
        return label
    }()
    
    private let cardHeadImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.masterCardLogo.image, contentMode: .center)
        return image
    }()
    
    private let cardMetalImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.chip.image, contentMode: .center)
        return image
    }()
    
    private let cardHeadStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 16)
            return stack
    }()
    
    private let cardBottomStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 8)
            return stack
    }()
    
    private let cardBottomStack1: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 16)
            return stack
    }()
    
    private let cardBottomStack2: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 16)
            return stack
    }()
    
    private let ellipse1: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.Ellipse1.image, contentMode: .scaleToFill)
        return image
    }()
    
    private let ellipse2: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.Ellipse2.image, contentMode: .scaleToFill)
        return image
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func build() {
        buildHeirarchy()
        buildConstraints()
    }
    
    func config(cardHolderName: String, cardExpireDate: String, cardNumber: String) {
        cardHolderNameLabel.text = cardHolderName
        cardNumberLabel.text = cardNumber
        cardExpireDateLabel.text = cardExpireDate
    }
    
    
    func buildHeirarchy() {
        contentView.addSubview(cardView)
        cardView.addSubview(cardHeadStack)
        cardView.addSubview(ellipse1)
        cardView.addSubview(ellipse2)
        cardHeadStack.addArrangedSubview(cardHeadImage)
        cardHeadStack.addArrangedSubview(cardHeadLabel)
        cardView.addSubview(cardBottomStack)
        cardBottomStack.addArrangedSubview(cardBottomStack1)
        cardBottomStack.addArrangedSubview(cardBottomStack2)
        cardBottomStack1.addArrangedSubview(cardHolderNameLabel)
        cardBottomStack1.addArrangedSubview(cardNumberLabel)
        cardBottomStack2.addArrangedSubview(cardExpireDateLabel)
        cardBottomStack2.addArrangedSubview(cardMetalImage)
    }
    
    func buildConstraints() {
        cardView.constrainEdges()
        ellipse1.constrain(.topAnchor,to: cardView.topAnchor, constant: 0)
        ellipse1.constrain(.trailingAnchor,to: cardView.trailingAnchor, constant: 0)
        ellipse2.constrain(.bottomAnchor,to: cardView.bottomAnchor, constant: 0)
        ellipse2.constrain(.leadingAnchor,to: cardView.leadingAnchor, constant: 0)
        cardHeadStack.constrain(.centerXAnchor, to: contentView.centerXAnchor)
        cardHeadStack.constrain(.topAnchor, to: cardView.topAnchor, constant: 32)
        cardBottomStack.constrain(.centerXAnchor, to: contentView.centerXAnchor)
        cardBottomStack.constrain(.bottomAnchor, to: cardView.bottomAnchor, constant: -45)
    }

}

