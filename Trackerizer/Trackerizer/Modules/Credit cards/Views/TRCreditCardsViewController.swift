//
//  CreditCardsViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 27/06/23.
//

import UIKit


class TRCreditCardsViewController: UIViewController {
    
     let viewModel = TRCreditcardViewModel()
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        viewModel.fetchCreditCardData()
        buildCollectionView()
        build()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private let bottomView: UIView = {
        let view = IOComponent.createView(color: TrackerizerColorAssests.greyScale50.color)
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return view
    }()
    
    var containerView: UIView!
    
    var scrollView: UIScrollView!
    
    
    lazy var addNewcategoryButtonButtton = RightIconButton(frame: CGRect(x: 0, y: 0, width: 0, height: 52))
    
    
    private let topLabel: UILabel = {
        let label = IOComponent.createLabel(text: "Calender")
        label.font =  UIFont(name: TrackerizerFontAssests.interRegular.font, size: 16)
        label.textColor = TrackerizerColorAssests.greyScale30.color
        return label
    }()
    
    private let SbubsLabel: UILabel = {
        let label = IOComponent.createLabel(text: "Subscription")
        label.font =  UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 16)
        label.textColor = TrackerizerColorAssests.ButonWhite.color
        return label
    }()
    
    private let settingButtton: UIButton = {
        let btn = IOComponent.createCustomButton(image:TrackerizerImageAssests.setting.image)
        return btn
    }()
    
    private lazy var spotifyIconImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.spotifyLogo.image, contentMode: .scaleToFill)
        return image
    }()
    
   
    
    private lazy var netflixIconImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.netfilx.image, contentMode: .scaleToFill)
//        image.constrain(.heightAnchor, constant: 45)
//        image.constrain(.widthAnchor, constant: 45)
        return image
    }()
    
    private lazy var onedriveIconImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.oneDriveLogo.image, contentMode: .scaleToFill)
        return image
    }()
    
    private lazy var youTubeIconImage: UIImageView = {
        let image = IOComponent.createImageView(image: TrackerizerImageAssests.yTPremiumLogo.image, contentMode: .scaleToFill)
        return image
    }()
    
    private let iConStackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 8)
        return stack
    }()
    
    private let mainStackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .center, spacing: 16)
        return stack
    }()
    
    
    
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        scrollView = UIScrollView()
        if #available(iOS 11.0, *) {
                 scrollView.contentInsetAdjustmentBehavior = .never
             } else {
                 automaticallyAdjustsScrollViewInsets = false
             }
        scrollView.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        containerView = UIView()
        containerView.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        containerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 750)
        scrollView.addSubview(containerView)
        scrollView.contentSize = containerView.bounds.size
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        buildHeirarchy()
        buildConstraints()
        addNewcategoryButtonButtton.configure(with: rightButtonProperties(text: "Add New category", image: TrackerizerImageAssests.add.image, backgroudcolor: .clear, textcolor: TrackerizerColorAssests.greyScale30.color))
        
    }
    
    func buildHeirarchy() {
        view.addSubview(bottomView)
        bottomView.addSubview(addNewcategoryButtonButtton)
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(settingButtton)
        containerView.addSubview(topLabel)
        containerView.addSubview(collectionView)
        containerView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(SbubsLabel)
        mainStackView.addArrangedSubview(iConStackView)
        iConStackView.addArrangedSubview(spotifyIconImage)
        iConStackView.addArrangedSubview(youTubeIconImage)
        iConStackView.addArrangedSubview(onedriveIconImage)
        iConStackView.addArrangedSubview(netflixIconImage)
       
    }
    
    func buildCollectionView() {
        let layout = TRCardsCollectionViewLayout(width: view.frame.width, Height: 350,noOfcards:  viewModel.noOfCards())
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TRCardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")
        collectionView.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        let swipeUpGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipeUp))
        collectionView.addGestureRecognizer(swipeUpGesture)
    }
    
    func buildConstraints() {
        
        bottomView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        bottomView.constrain(.bottomAnchor, to: view.bottomAnchor, constant: 0)
        bottomView.constrain(.heightAnchor, constant: view.frame.height * 0.22)
        addNewcategoryButtonButtton.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        addNewcategoryButtonButtton.constrain(.topAnchor, to: bottomView.topAnchor, constant: 24)
        addNewcategoryButtonButtton.constrain(.heightAnchor, constant: 52)
        scrollView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        scrollView.constrain(.topAnchor, to: view.topAnchor, constant: 0)
        scrollView.constrain(.bottomAnchor,to: bottomView.topAnchor, constant: 0)
        topLabel.constrain(.topAnchor, to: containerView.topAnchor, constant: 50)
        topLabel.constrain(.centerXAnchor, to: containerView.centerXAnchor)
        settingButtton.constrainSize(width: 24, height: 24)
        settingButtton.constrain(.topAnchor,to: containerView.topAnchor, constant: 50)
        settingButtton.constrain(.trailingAnchor,to: containerView.trailingAnchor, constant: -25)
        collectionView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        collectionView.constrain(.topAnchor, to: topLabel.bottomAnchor, constant: 45)
        collectionView.constrain(.heightAnchor, constant: 420)
        mainStackView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        mainStackView.constrain(.topAnchor, to: collectionView.bottomAnchor,constant: 5)
        
        
    }
    
    @objc func handleSwipeUp(sender: UIPanGestureRecognizer) {
        guard sender.state == .began else {
            return
        }

        let swipeUpPoint = sender.location(in: collectionView)

        if let indexPath = collectionView.indexPathForItem(at: swipeUpPoint) {
            // Get the first card cell and the last card cell
            guard let firstCell = collectionView.cellForItem(at: indexPath),
                  let lastCell = collectionView.cellForItem(at: IndexPath(item: collectionView.numberOfItems(inSection: 0) - 1, section: 0)) else {
                return
            }
            let xOffset = lastCell.frame.origin.x - firstCell.frame.origin.x
            let yOffset = lastCell.frame.origin.y - firstCell.frame.origin.y
            collectionView.performBatchUpdates({
                collectionView.moveItem(at: indexPath, to: IndexPath(item: collectionView.numberOfItems(inSection: 0) - 1, section: 0))
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, animations: {
                    firstCell.transform = CGAffineTransform(translationX: xOffset, y: yOffset)
                })
            })
        }
    }

    
}



extension TRCreditCardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.noOfCards()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? TRCardCollectionViewCell else {
            return UICollectionViewCell()
        }
        let dataSource = viewModel.getData()
        cell.config(cardHolderName: dataSource[indexPath.row].name, cardExpireDate: dataSource[indexPath.row].birthday, cardNumber: dataSource[indexPath.row].creditCard)
        return cell
    }
    
}
