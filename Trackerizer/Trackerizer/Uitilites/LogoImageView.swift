//
//  LogoImageView.swift
//  Trackerizer
//
//  Created by Kishor LD on 18/06/23.
//

import UIKit

class LogoImageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoPart1Image: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.logopart1Icon.image , contentMode: .scaleAspectFit)
        return image
    }()
    
    let logoPart2Image: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.logopart2Icon.image , contentMode: .scaleAspectFit)
        return image
    }()
    
    let logoStack: UIStackView = {
        let  stack = IOComponent.createStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 13)
        return stack
    }()
    
    func build() {
        buildHeirarchy()
        buildConstraints()
    }
    
    func buildHeirarchy() {
        addSubview(logoStack)
        logoStack.addArrangedSubview(logoPart1Image)
        logoStack.addArrangedSubview(logoPart2Image)
        
    }
    
    func buildConstraints() {
        logoStack.constrainEdges()
        logoPart1Image.constrain(.widthAnchor, constant: 28)
        logoPart2Image.constrain(.heightAnchor, constant: 50)
        logoPart2Image.constrain(.widthAnchor, constant: 137)
    }

}
