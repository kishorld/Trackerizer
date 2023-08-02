//
//  boxView.swift
//  Trackerizer
//
//  Created by Kishor LD on 25/06/23.
//

import UIKit

class boxView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func build() {
        backgroundColor = TrackerizerColorAssests.dottedGreyScale60.color
        layer.borderColor = TrackerizerColorAssests.GreyScale40.color.cgColor
        layer.borderWidth = 0.5
        buildHeirarchy()
        buildConstraints()
    }
    
    func buildConstraints() {
        containerView.constrainEdges()
        lineView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 30))
        lineView.constrain(.topAnchor, to: containerView.topAnchor, constant: 0)
        stackview.constrain(.centerXAnchor, to: containerView.centerXAnchor)
        stackview.constrain(.centerYAnchor, to: containerView.centerYAnchor)

    }
    
    func buildHeirarchy() {
        addSubview(containerView)
        containerView.addSubview(lineView)
        containerView.addSubview(stackview)
        stackview.addArrangedSubview(descriptionlabel)
        stackview.addArrangedSubview(valueLabel)
    }
    
    
    private let stackview: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 5)
        return stack
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.constrain(.heightAnchor, constant: 3)
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let descriptionlabel: UILabel = {
        let label = IOComponent.createLabel(textColor: TrackerizerColorAssests.GreyScale40.color)
        label.font = UIFont(name:TrackerizerFontAssests.interSemiBold.font , size: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = IOComponent.createLabel(textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name:TrackerizerFontAssests.interBold.font , size: 14)
        label.textAlignment = .center
        return label
    }()
    
    func config(descriptionLabelText: String, lineViewColor: UIColor,valueLabelText: String) {
        descriptionlabel.text = descriptionLabelText
        lineView.backgroundColor = lineViewColor
        valueLabel.text = valueLabelText
    }
}
