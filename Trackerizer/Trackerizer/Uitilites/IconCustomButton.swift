//
//  iconCustomButton.swift
//  Trackerizer
//
//  Created by Kishor LD on 17/06/23.
//

import UIKit

struct buttonProperties {
    let text: String
    let image: UIImage?
    let backgroudcolor: UIColor?
    let textcolor: UIColor?
}

class IconCustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(view)
        view.constrainEdges()
        view.addSubview(stack)
        stack.addArrangedSubview(iconimage)
        stack.addArrangedSubview(label)
        stack.constrain(.centerYAnchor, to: view.centerYAnchor)
        stack.constrain(.centerXAnchor, to: view.centerXAnchor)
        label.constrain(.height, constant: 20)
        iconimage.constrain(.widthAnchor, constant: 15)
        setUpButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpButton() {
        label.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        layer.cornerRadius = 24
    }
    func setUpShadow(shadowColor: UIColor) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.5
       layer.shadowRadius = 8
       layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func configure(with viewmodel: buttonProperties) {
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

extension UIView  {
    func addBottomShadow(color: String) {
        layer.masksToBounds = true
        layer.shadowRadius = 25
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(named: color)?.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 3)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                     y: bounds.maxY - layer.shadowRadius,
                                                     width: bounds.width,
                                                     height: layer.shadowRadius)).cgPath
    }
}
