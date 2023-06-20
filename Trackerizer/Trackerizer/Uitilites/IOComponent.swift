//
//  IOComponent.swift
//  Trackerizer
//
//  Created by Kishor LD on 12/06/23.
//

import Foundation
import YMatterType
import YCoreUI
import UIKit

class IOComponent: NSObject {
    // Image View
    class func createImageView(
        image: UIImage,
        contentMode: UIView.ContentMode,
        cornerRadius: CGFloat = 0.0,
        clipToBounds: Bool = true
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = contentMode
        imageView.image = image
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = clipToBounds
        return imageView
    }
    
    // Activity Indicator
    class func createActivityIndicator(
        style: UIActivityIndicatorView.Style,
        color: UIColor
    ) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.color = color
        return activityIndicator
    }
    
    // Stack View
    class func createStackView(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution,
        alignment: UIStackView.Alignment,
        spacing: CGFloat
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = spacing
        return stackView
    }
    
    // Typography Label
    class func createLabel(
        text: String? = nil,
        textColor: UIColor = .darkGray,
        lineBreakMode: NSLineBreakMode = .byWordWrapping,
        numberOfLines: Int = 0
    ) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        if let text = text {
            label.text = text
        }
        label.lineBreakMode = lineBreakMode
        label.numberOfLines = numberOfLines
        return label
    }
    
    // UIView
    class func createView(color: UIColor = .clear) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
    // Typography Button
    class func createTitleButton(
        title: String,
        titleColor: UIColor,
        backGroundColor: UIColor = .clear,
        horizontalAlignment: UIControl.ContentHorizontalAlignment = .center,
        veritcalAlignment: UIControl.ContentVerticalAlignment = .center
    ) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = horizontalAlignment
        button.contentVerticalAlignment = veritcalAlignment
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backGroundColor
        return button
    }
    
    // Custom UIButton
    class func createCustomButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        return button
    }
    
    // TableView
    class func createTableView(
        style: UITableView.Style = .grouped,
        backgroundColor: UIColor = .clear,
        estimatedRowHeight: CGFloat? = nil,
        rowHeight: CGFloat? = nil,
        showHorizonatalIndicator: Bool = false,
        showVerticalIndicator: Bool = false,
        seperatorStyle: UITableViewCell.SeparatorStyle = .none
    ) -> UITableView {
        let tableView = UITableView(frame: .zero, style: style)
        tableView.showsHorizontalScrollIndicator = showHorizonatalIndicator
        tableView.showsVerticalScrollIndicator = showVerticalIndicator
        tableView.separatorStyle = seperatorStyle
        tableView.backgroundColor = backgroundColor
        if let height = estimatedRowHeight {
            tableView.estimatedRowHeight = height
        }
        if let height = rowHeight {
            tableView.rowHeight = height
        }
        return tableView
    }
    
    // Collectionview
    class func createCollectionView(
        showHorizonatalIndicator: Bool = false,
        showVerticalIndicator: Bool = false
    ) -> UICollectionView {
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionview.showsVerticalScrollIndicator = showVerticalIndicator
        collectionview.showsHorizontalScrollIndicator = showHorizonatalIndicator
        return collectionview
    }
}
