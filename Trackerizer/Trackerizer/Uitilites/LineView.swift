//
//  LineView.swift
//  CustomPasswordAnimation
//
//  Created by Kishor LD on 20/07/23.
//

import UIKit

class LineView: UIView {
    
    var hasFrontAnimated = false
    var hasBackAnimated = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(width: CGFloat, progressColor: UIColor) {
            self.init(frame: CGRect(x: 0, y: 0, width: width, height: 2))
            progressLayer.strokeColor = progressColor.cgColor // Set the progress layer color here
        }
    
    let progressLayer = CAShapeLayer()
    private func drawLine() {
        let path = UIBezierPath()
        let startPoint = CGPoint(x: 0, y: 0) // Replace with your desired starting point
        let endPoint = CGPoint(x: frame.width, y: 0) // Replace with your desired ending point
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 5.0 // Set the line width to your desired value
        shapeLayer.strokeColor = UIColor.gray.cgColor // Set the line color to your
        layer.addSublayer(shapeLayer)
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 6
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(progressLayer)
        
    }
    
    
    func addAnimation() {
        if !hasFrontAnimated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 0.5
            animation.toValue = 1
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            progressLayer.add(animation, forKey: "lineFillAnimation")
            hasFrontAnimated = true
        }
    }
    
    func removeAnimation() {
        if !hasBackAnimated {
            let backwardAnimation = CABasicAnimation(keyPath: "strokeEnd")
            backwardAnimation.duration = 0.5
            backwardAnimation.toValue = -0.10
            backwardAnimation.fillMode = .forwards
            backwardAnimation.isRemovedOnCompletion = false
            progressLayer.add(backwardAnimation, forKey: "lineBackwardAnimation")
            hasBackAnimated = true
        }
    }
    
    func animationPause() {
        let annimation = CABasicAnimation()
        
    }
    
}
