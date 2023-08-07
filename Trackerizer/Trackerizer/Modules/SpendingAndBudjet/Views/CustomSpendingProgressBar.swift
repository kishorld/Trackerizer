//
//  CustomSpendingProgressBar.swift
//  Trackerizer
//
//  Created by Kishor LD on 06/07/23.
//

import UIKit

class CustomSpendingProgressBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        build()
        createCircular1Path()
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircular1Path()
    }
    private var circleLayer = CAShapeLayer()
  
    func createCircular1Path() {

        let startPoint = CGFloat(Double.pi)
        let endPoint = CGFloat(0)
        print(frame.size)
        let radius = (frame.size.width > 450) ? 160 : frame.size.width *  0.27
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 5.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.gray.cgColor
        layer.addSublayer(circleLayer)
        addProgressLayer(pathCcolor: TrackerizerColorAssests.lightBlue.color.cgColor, startingPoint: 0.0, endingPoint: 0.10, circularPath: circularPath)
        addProgressLayer(pathCcolor: TrackerizerColorAssests.ButtonOrange.color.cgColor, startingPoint:  0.15, endingPoint: 0.35, circularPath: circularPath)
        addProgressLayer(pathCcolor: TrackerizerColorAssests.lightPurple.color.cgColor, startingPoint:  0.40, endingPoint:  0.7, circularPath: circularPath)
    }
    
    func addProgressLayer(pathCcolor: CGColor, startingPoint: CGFloat, endingPoint: CGFloat, circularPath: UIBezierPath) {
        let progressLayer = CAShapeLayer()
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeStart = startingPoint
        progressLayer.strokeEnd = endingPoint
        progressLayer.strokeColor = pathCcolor
        progressLayer.shadowRadius = 10
        progressLayer.shadowColor = pathCcolor
        progressLayer.shadowOffset = CGSize(width: 1, height: 0)
        progressLayer.shadowOpacity = 1
      layer.addSublayer(progressLayer)
    }
    
    private let budgetLabel: UILabel = {
        let label = IOComponent.createLabel()
        label.text = "$82,97"
        label.font = UIFont(name: TrackerizerFontAssests.interBold.font, size: 24)
        label.textColor = TrackerizerColorAssests.ButonWhite.color
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = IOComponent.createLabel()
        label.text = "of $2,000 budget"
        label.textColor = TrackerizerColorAssests.greyScale30.color
        label.font = UIFont(name: TrackerizerFontAssests.interMedium.font, size:12)
        return label
    }()
    
    private let stackview: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 4)
        return stack
    }()
    
    func build() {
        
        addSubview(stackview)
        stackview.addArrangedSubview(budgetLabel)
        stackview.addArrangedSubview(descriptionLabel)
        stackview.constrain(.centerXAnchor, to: self.centerXAnchor)
        stackview.constrain(.topAnchor,to: topAnchor, constant: -50)
    }

}
