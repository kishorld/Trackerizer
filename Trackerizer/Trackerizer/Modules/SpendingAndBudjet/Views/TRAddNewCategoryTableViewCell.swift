//
//  AddNewCategoryTableViewCell.swift
//  Trackerizer
//
//  Created by Kishor LD on 17/07/23.
//

import UIKit

class TRAddNewCategoryTableViewCell: UITableViewCell {
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.addDashBorder()
    }
    
    private let containerView: UIView = {
        let view = UIView()
        return  view
    }()
    
    private let addabel: UILabel = {
        let label = IOComponent.createLabel(text: "Add new category")
        label.font =  UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        label.textColor = TrackerizerColorAssests.greyScale30.color
        return label
        
    }()
    
    private let addimag: UIImageView = {
        let image = IOComponent.createImageView(image:TrackerizerImageAssests.add.image, contentMode: .scaleAspectFit)
        return image
    }()
    
    private let addStack:  UIStackView = {
        let stack = IOComponent.createStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 8)
        return stack
    }()
    
    func buildHeirarchy() {
        addSubview(containerView)
        containerView.addSubview(addStack)
        addStack.addArrangedSubview(addabel)
        addStack.addArrangedSubview(addimag)
    }
    
    func buildConstraints() {
        containerView.constrainEdges(.vertical, with: .init(topAndBottom: 8))
        containerView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        containerView.constrain(.heightAnchor, constant: 84)
        addStack.constrain(.centerXAnchor, to: containerView.centerXAnchor)
        addStack.constrain(.centerYAnchor, to: containerView.centerYAnchor)
    }
    
       
}






