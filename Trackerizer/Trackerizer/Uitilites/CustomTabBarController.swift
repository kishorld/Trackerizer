//
//  CustomTabBarController.swift
//  Trackerizer
//
//  Created by Kishor LD on 27/06/23.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    weak var coordinator: TRHomeCoordinator?
    let btnMiddle: UIButton = {
        let btn = IOComponent.createCustomButton(image: TrackerizerImageAssests.plus.image)
        btn.backgroundColor = TrackerizerColorAssests.ButtonOrange.color
        btn.layer.cornerRadius = 24
        btn.layer.shadowColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.shadowRadius = 10
      
        return btn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSomeTabItems()
        btnMiddle.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 25, y: -10, width: 48, height: 48)
    }
    
    override func loadView() {
        super.loadView()
        setupCustomTabBar()
    }
    let newTabBarHeight: CGFloat = 60
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    func setupCustomTabBar() {
        let customTabBar = CustomtabBar()
        self.setValue(customTabBar, forKey: "tabBar")
        let path : UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 0
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        self.tabBar.layer.insertSublayer(shape, at: 0)
    }
    
    func addSomeTabItems() {
        let vc1 = UINavigationController(rootViewController: TRHomeViewController())
        let vc3 = UINavigationController(rootViewController: TRCalenderViewController())
        let vc2 = UINavigationController(rootViewController: TRSpendingAndBudgetViewController())
        let vc4  = UINavigationController(rootViewController: TRCreditCardsViewController())
        setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        guard let items = tabBar.items else { return}
        items[0].image = TrackerizerImageAssests.home.image
        items[1].image = TrackerizerImageAssests.spending.image
        items[2].image = TrackerizerImageAssests.calender.image
        items[3].image = TrackerizerImageAssests.cards.image
        
    }
    
    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = newTabBarHeight
        let path = UIBezierPath()
        let holeWidth = 60
        let radius: CGFloat = frameHeight/3
        let leftXUntilHole = (Int(frameWidth/2) - Int(holeWidth/2)) - Int(radius)
        let leadingAnndTrailinngGap: CGFloat = 20
        path.move(to: CGPoint(x: radius + leadingAnndTrailinngGap, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole , y: 0)) // 1.Line
        path.addArc(withCenter: CGPoint(x: leftXUntilHole, y: 20), radius: 20, startAngle: CGFloat(Double.pi/2 * 3), endAngle: CGFloat(0), clockwise: true)
        path.addArc(withCenter: CGPoint(x: leftXUntilHole + 50, y: 20), radius: 30, startAngle: CGFloat(Double.pi), endAngle: CGFloat(0), clockwise: false)
        path.addArc(withCenter: CGPoint(x: leftXUntilHole + 100, y: 20), radius:20, startAngle: CGFloat(Double.pi ), endAngle: CGFloat(Double.pi/2 *  3), clockwise: true)
        path.addLine(to: CGPoint(x: frameWidth - radius - leadingAnndTrailinngGap, y: 0))
        path.addArc(withCenter: CGPoint(x: frameWidth - radius - leadingAnndTrailinngGap, y: radius), radius: radius, startAngle: CGFloat(CGFloat(Double.pi/2 * 3)), endAngle: CGFloat(0), clockwise: true)
//        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight))
        path.addArc(withCenter: CGPoint(x: frameWidth - radius - leadingAnndTrailinngGap, y: frameHeight - radius), radius: radius, startAngle: CGFloat(CGFloat(0)), endAngle: CGFloat(Double.pi/2 ), clockwise: true)
        path.addLine(to: CGPoint(x: radius + leadingAnndTrailinngGap, y: frameHeight))
        path.addArc(withCenter: CGPoint(x: radius + leadingAnndTrailinngGap, y: frameHeight - radius), radius: radius, startAngle: CGFloat(CGFloat(90)), endAngle: CGFloat(Double.pi ), clockwise: true)
        path.addLine(to: CGPoint(x: leadingAnndTrailinngGap, y: radius)) // 4. Line
        path.addArc(withCenter: CGPoint(x: radius + leadingAnndTrailinngGap, y: radius), radius: radius, startAngle: CGFloat(CGFloat(Double.pi )), endAngle: CGFloat(Double.pi/2 *  3), clockwise: true)

        path.close()
        return path
       
    }
}

class CustomtabBar: UITabBar {
    
    let btnMiddle: UIButton = {
        let btn = IOComponent.createCustomButton(image: TrackerizerImageAssests.plus.image)
        btn.backgroundColor = TrackerizerColorAssests.ButtonOrange.color
        btn.layer.cornerRadius = 24
        btn.layer.shadowColor = TrackerizerColorAssests.ButtonOrange.color.cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.shadowRadius = 10
      
        return btn
    }()
    
    override func layoutSubviews() {
                super.layoutSubviews()
        barTintColor = .clear
        backgroundColor = .clear
        tintColor =  TrackerizerColorAssests.ButonWhite.color
        unselectedItemTintColor = TrackerizerColorAssests.greyScale30.color
                addSubview(btnMiddle)
                let itemCount = items?.count ?? 0
                let itemWidth = bounds.width / CGFloat(itemCount) - 30
                var itemIndex: CGFloat = 0
                self.itemSpacing = 20
                
                for subview in subviews {
                    if subview is UIControl {
                        var newX = itemWidth * itemIndex + 10
                        if itemIndex == 0 {
                            newX = itemWidth * itemIndex + 30
                        } else if itemIndex == 1 {
                            newX = itemWidth * itemIndex + 25
                        } else if itemIndex == 2 {
                            newX = itemWidth * itemIndex + 90
                        } else if itemIndex == 3 {
                            newX = itemWidth * itemIndex + 90
                        }
                        
                        subview.frame = CGRect(x: newX, y: subview.frame.origin.y + 10, width: itemWidth, height: subview.frame.size.height - 4.0)
                        itemIndex += 1
                    }
                }
                
        btnMiddle.frame = CGRect(x: Int(self.bounds.width)/2 - 25, y: -10, width: 48, height: 48)
            }
}
