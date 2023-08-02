//
//  RightIconButton.swift
//  Trackerizer
//
//  Created by Kishor LD on 27/07/23.
//

import UIKit
struct rightButtonProperties {
    let text: String
    let image: UIImage?
    let backgroudcolor: UIColor?
    let textcolor: UIColor?
}

class RightIconButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(view)
        view.constrainEdges()
        view.addSubview(stack)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(iconimage)
        stack.constrain(.centerYAnchor, to: view.centerYAnchor)
        stack.constrain(.centerXAnchor, to: view.centerXAnchor)
        setUpButton()
       
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addDashBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpButton() {
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        layer.cornerRadius = frame.height / 2
    }
    func setUpShadow(shadowColor: UIColor) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.5
       layer.shadowRadius = 8
       layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func configure(with viewmodel: rightButtonProperties) {
        label.text = viewmodel.text
        iconimage.image = viewmodel.image
        backgroundColor = viewmodel.backgroudcolor
        label.textColor = viewmodel.textcolor
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        return  label
    }()
    
    let iconimage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let stack: UIStackView = {
        let stackview  = IOComponent.createStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 10)
        return stackview
    }()
    
    let view: UIView = {
        let view   = IOComponent.createView()
        return view
    }()

}

