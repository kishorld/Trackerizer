//
//  CustomProgressBar.swift
//  Trackerizer
//
//  Created by Kishor LD on 23/06/23.
//

import UIKit

class TRCustomCircularProgressBar: UIView {
    
    private let progressLabel: UILabel = {
        let label = IOComponent.createLabel(text: "$1,234", textColor: TrackerizerColorAssests.ButonWhite.color)
        label.font = UIFont(name: TrackerizerFontAssests.interBold.font, size: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let seebudgetButton: UIButton =  {
        let button = IOComponent.createTitleButton(title: "See your budget ", titleColor: TrackerizerColorAssests.ButonWhite.color)
        button.layer.cornerRadius = 16
        button.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 10)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 30)
        return stack
    }()
    
    private let billStackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 10)
        return stack
    }()
    
    let logoPart1Image: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.logopart1Icon.image , contentMode: .scaleAspectFit)
        return image
    }()
    
    let logoPart2Image: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.logopart2Icon.image , contentMode: .scaleAspectFit)
        return image
    }()
    
    let logoStack: UIStackView = {
        let  stack = IOComponent.createStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 5)
        return stack
    }()
    
    private let thisMothLabel: UILabel = {
        let label = IOComponent.createLabel(text: "This month bills", textColor: TrackerizerColorAssests.GreyScale40.color)
        label.font = UIFont(name: TrackerizerFontAssests.interRegular.font, size: 12)
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        build()
        addTopTopdottedlayer()
        createCircularPath()
        addTopdottedlayer()
        addBottomdottedlayer()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func build() {
        addSubview(progressLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(logoStack)
        stackView.addArrangedSubview(billStackView)
        stackView.addArrangedSubview(seebudgetButton)
        billStackView.addArrangedSubview(progressLabel)
        billStackView.addArrangedSubview(thisMothLabel)
        logoStack.addArrangedSubview(logoPart1Image)
        logoStack.addArrangedSubview(logoPart2Image)
        logoPart1Image.constrain(.widthAnchor, constant: 18)
        logoPart2Image.constrain(.heightAnchor, constant: 20)
        logoPart2Image.constrain(.widthAnchor, constant: 83)
        seebudgetButton.constrain(.heightAnchor, constant: 32)
        seebudgetButton.constrain(.widthAnchor, constant: 120)
        stackView.constrain(.centerXAnchor, to: self.centerXAnchor)
        stackView.constrain(.centerYAnchor, to: self.centerYAnchor)
    }
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-5 * Double.pi / 4)
    private var endPoint = CGFloat(Double.pi / 4)
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 140, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 10.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
        progressLayer.shadowRadius = 10
        progressLayer.shadowColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
        progressLayer.shadowOffset = CGSize(width: 1, height: 0)
        progressLayer.shadowOpacity = 1
        layer.addSublayer(progressLayer)
    }
    func addBottomdottedlayer() {
        let circleLayer = CAShapeLayer()
        let startPoint = CGFloat(-5 * Double.pi / 4)
        let endPoint = CGFloat(Double.pi / 4)
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 120, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.lineDashPattern = [0,15]
        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 2.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
    }
    
    func addTopdottedlayer() {
        let circleLayer = CAShapeLayer()
        let startPoint = CGFloat(-5 * Double.pi / 4)
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 160, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.lineDashPattern = [0,7]
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 2.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
    }
    
    func addTopTopdottedlayer() {
        let circleLayer = CAShapeLayer()
        let startPoint = CGFloat(-Double.pi)
        let endPoint = CGFloat(0)
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 180, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        // circleLayer path defined to circularPath
        circleLayer.lineDashPattern = [0,7]
        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 2.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
    }
    
    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 0.85
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
