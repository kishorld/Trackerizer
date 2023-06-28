//
//  TRHomeViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 19/06/23.
//

import UIKit

class TRHomeViewController: UIViewController {
    let segmentItems = ["Your Subscribtions","Upcoming bills"]
    let viewModel = TRHomeViewModel()
    var selectedSegmnt = 0
    weak var trHomeCoordinator: TRHomeCoordinator?
    var circularViewDuration: TimeInterval = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
        tableView.reloadData()
        tableView.register(TRHomeTableViewCell.self, forCellReuseIdentifier: "HomeCell")
        setUpCircularProgressBarView()
        
    }
    
    private let settingButtton: UIButton = {
        let btn = IOComponent.createCustomButton(image:TrackerizerImageAssests.setting.image)
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
        let boxview1Height = boxview1.frame.size.height
        boxview1.layer.cornerRadius = boxview1Height / 4
        boxview2.layer.cornerRadius = boxview1Height / 4
        boxview3.layer.cornerRadius = boxview1Height / 4
        newslider.layer.cornerRadius = newslider.frame.size.height/2
        
    }
    
    private lazy var  tableView: UITableView = {
        let table = IOComponent.createTableView(style: .plain,seperatorStyle: .none)
        table.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()

    private let circularProgreessView = CustomCircularProgressBar()
    private let containerView: UIView = {
        let containerview = UIView()
        containerview.backgroundColor = TrackerizerColorAssests.GreyScale.color
        containerview.layer.cornerRadius = 20
        containerview.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        return containerview
    }()
    
    let activityIndicator : UIActivityIndicatorView = {
        let  indicator = UIActivityIndicatorView()
        indicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        indicator.color = TrackerizerColorAssests.textGrey.color
        return indicator
    }()
    
    private let boxview1: UIView = {
        let view = boxView()
        view.config(descriptionLabelText: "Active Stubs", lineViewColor: TrackerizerColorAssests.ButtonOrange.color, valueLabelText:"20")
        return view
    }()
    
    private let boxview2: UIView = {
        let view = boxView()
        view.config(descriptionLabelText: "Highest Stubs", lineViewColor: TrackerizerColorAssests.lightPurple.color, valueLabelText:"$19.99")
        return view
    }()
    private let boxview3: UIView = {
        let view = boxView()
        view.config(descriptionLabelText: "Lowest Stubs", lineViewColor: TrackerizerColorAssests.lightBlue.color, valueLabelText:"$6.99")
        return view
    }()
    
    private let boxStack: UIStackView = {
        let stack = IOComponent.createStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 10)
        return stack
    }()
    
     private let segmentContainerView: UIView = {
        let containerview = UIView()
        containerview.backgroundColor = TrackerizerColorAssests.ButtonBlack.color
        containerview.layer.cornerRadius = 15
        return containerview
    }()
    
     let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Your Subscribtions","Upcoming bills"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentTapped), for: .valueChanged)
        return segment
    }()
    
//    private var sliderView: UIView!
    
    @objc func segmentTapped(_ sender: UISegmentedControl) {
        
        let selectedSegmentIndex = sender.selectedSegmentIndex
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        let targetX = CGFloat(selectedSegmentIndex) * segmentWidth
        
        UIView.animate(withDuration: 0.3) {
            self.newslider.frame.origin.x = targetX
        }
        tableView.reloadData()
    }
    
    func setupSegmeenntView() {
        segmentControl.backgroundColor = .black
        segmentControl.tintColor = .clear
        segmentControl.layer.cornerRadius = 15
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 12)!,
            NSAttributedString.Key.foregroundColor: TrackerizerColorAssests.ButonWhite.color
        ]
        let normalAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 12)!,
            NSAttributedString.Key.foregroundColor: TrackerizerColorAssests.GreyScale40.color
        ]
        segmentControl.setTitleTextAttributes(normalAttributes, for: .normal)
        segmentControl.setTitleTextAttributes(selectedAttributes, for: .selected)
        segmentControl.selectedSegmentTintColor = TrackerizerColorAssests.Buttongrey.color
        segmentControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentControl.addTarget(self, action: #selector(segmentTapped), for: .valueChanged)

    }
    
    private let newslider: UIView = {
        let slider = UIView()
        slider.layer.borderWidth = 0.5
        slider.layer.borderColor =  TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        slider.backgroundColor = TrackerizerColorAssests.Buttongrey.color
        return slider
    }()
    
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        buildHeirarchy()
        buildConstraints()
        setupSegmeenntView()
    }
    
    func buildHeirarchy() {
        view.addSubview(containerView)
        view.addSubview(segmentContainerView)
        segmentContainerView.addSubview(segmentControl)
        view.addSubview(tableView)
        containerView.addSubview(settingButtton)
        containerView.addSubview(circularProgreessView)
        containerView.addSubview(boxStack)
        boxStack.addArrangedSubview(boxview1)
        boxStack.addArrangedSubview(boxview2)
        boxStack.addArrangedSubview(boxview3)
        segmentControl.addSubview(newslider)
        
        
    }
    
    func buildConstraints() {
        containerView.constrain(.height, constant: view.frame.height/2 + 50)
        containerView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        containerView.constrain(.topAnchor, to: view.topAnchor, constant: 0)
        settingButtton.constrainSize(width: 24, height: 24)
        settingButtton.constrain(.topAnchor,to: containerView.topAnchor, constant: 50)
        settingButtton.constrain(.trailingAnchor,to: containerView.trailingAnchor, constant: -25)
        circularProgreessView.constrain(.centerXAnchor, to: containerView.centerXAnchor)
        circularProgreessView.constrain(.centerYAnchor, to: containerView.centerYAnchor)
        segmentContainerView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 20))
        segmentContainerView.constrain(.topAnchor,to: containerView.bottomAnchor, constant: 20)
        segmentContainerView.constrain(.heightAnchor, constant: 60)
        tableView.constrain(.topAnchor, to: segmentContainerView.bottomAnchor,constant: 20)
        tableView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        tableView.constrain(.bottomAnchor, to: view.bottomAnchor, constant: 0)
        segmentControl.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 10))
        segmentControl.constrainEdges(.vertical, with: .init(topAndBottom: 10))
        boxStack.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 20))
        boxStack.constrain(.bottomAnchor, to: containerView.bottomAnchor, constant: -20)
        boxview1.constrain(.heightAnchor, constant: view.frame.size.height * 0.08)
        newslider.constrain(.height, constant: 40)
        newslider.constrain(.widthAnchor, constant: view.frame.width * 0.4)
    }
    func setUpCircularProgressBarView() {
        circularProgreessView.progressAnimation(duration: circularViewDuration)
    }
}
