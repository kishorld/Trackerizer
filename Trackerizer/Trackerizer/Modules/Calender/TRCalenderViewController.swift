//
//  TRCalenderViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 27/06/23.
//

import UIKit

class TRCalenderViewController: UIViewController {
    var selectedIndexPath = 0
    let viewModel = TRHomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fecthHomeData()
        datecollectionView.reloadData()
        
        build()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        datecollectionView.constrain(.topAnchor, to: containerView.topAnchor, constant: containerView.frame.height * 0.60)
        datecollectionView.constrain(.bottomAnchor,to: containerView.bottomAnchor, constant: -containerView.frame.height * 0.11)
    }
    
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround
            .color
        self.navigationController?.isNavigationBarHidden = true
        buildHeirarchy()
        buildConstraints()
    }
    
    private let topLabel: UILabel = {
        let label = IOComponent.createLabel(text: "Calender")
        label.font =  UIFont(name: TrackerizerFontAssests.interRegular.font, size: 16)
        label.textColor = TrackerizerColorAssests.greyScale30.color
        return label
    }()
    
    private let headTitleLabel: UILabel = {
        let label = IOComponent.createLabel(text: "Subs\nSchedule")
        label.font =  UIFont(name: TrackerizerFontAssests.interBold.font, size: 48)
        label.textColor = TrackerizerColorAssests.ButonWhite.color
        return label
    }()
    
    private let headSubTitleLabel: UILabel = {
        let label = IOComponent.createLabel(text: "3 subscriptions for today")
        label.font =  UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        label.textColor = TrackerizerColorAssests.greyScale30.color
        return label
    }()
    private let currentMonthLabel: UILabel = {
        let label = IOComponent.createLabel(text: "January")
        label.font =  UIFont(name: TrackerizerFontAssests.interBold.font, size: 20)
        label.textColor = TrackerizerColorAssests.ButonWhite.color
        return label
    }()
    private let currentdateLabel: UILabel = {
        let label = IOComponent.createLabel(text: "01.08.2023")
        label.font =  UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        label.textColor = TrackerizerColorAssests.greyScale30.color
        return label
    }()
    private let totalBillLabel: UILabel = {
        let label = IOComponent.createLabel(text: "$24.99")
        label.font =  UIFont(name: TrackerizerFontAssests.interBold.font, size: 20)
        label.textColor = TrackerizerColorAssests.ButonWhite.color
        return label
    }()
    private let totalBillSubTitleLabel: UILabel = {
        let label = IOComponent.createLabel(text: "in upcoming bills")
        label.font =  UIFont(name: TrackerizerFontAssests.interMedium.font, size: 12)
        label.textColor = TrackerizerColorAssests.greyScale30.color
        return label
    }()
    private let dateStackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .leading, spacing: 4)
        return stack
    }()
    
    private let billStackView: UIStackView = {
        let stack = IOComponent.createStackView(axis: .vertical, distribution: .fill, alignment: .trailing, spacing: 4)
        return stack
    }()
    
    private let monthDropdownButton: UIButton = {
        let button = IOComponent.createTitleButton(title: "January", titleColor: TrackerizerColorAssests.ButonWhite.color, backGroundColor: TrackerizerColorAssests.dottedGreyScale60.color)
        button.titleLabel?.font = UIFont(name: TrackerizerFontAssests.interBold.font, size: 12)
            button.addTarget(self, action: #selector(monthDropdownTapped), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        return button
    }()
    
    lazy var monthOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = TrackerizerColorAssests.GreyScale.color
        return tableView
    }()
    
    private let settingButtton: UIButton = {
        let btn = IOComponent.createCustomButton(image:TrackerizerImageAssests.setting.image)
        return btn
    }()
    
    private let containerView: UIView = {
        let containerview = UIView()
        containerview.backgroundColor = TrackerizerColorAssests.GreyScale.color
        containerview.layer.cornerRadius = 20
        containerview.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        return containerview
    }()
    
    lazy  var datecollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor =  TrackerizerColorAssests.GreyScale.color
        collection.dataSource = self
        collection.delegate = self
        collection.allowsMultipleSelection = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(TRDateDayCollectionViewCell.self, forCellWithReuseIdentifier: "TRDateDayCollectionViewCell")
        return collection
    }()
    
    lazy  var upcomingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor =  TrackerizerColorAssests.AppBackGround.color
        collection.dataSource = self
        collection.delegate = self
        collection.showsVerticalScrollIndicator = false
        collection.register(TRUpcomingCollectionViewCell.self, forCellWithReuseIdentifier: "TRUpcomingCollectionViewCell")
        return collection
    }()
    
    @objc private func monthDropdownTapped() {
        monthOptionsTableView.isHidden = !monthOptionsTableView.isHidden
    }
    
    func updateCalendarDataForSelectedMonth(month: Int) {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())

        guard let selectedDate = calendar.date(from: DateComponents(year: year, month: month + 1, day: 1)) else {
            return
        }
        let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: selectedDate)?.count ?? 0
        guard let weekdayIndex = calendar.dateComponents([.weekday], from: selectedDate).weekday else {
            return
        }

        TracerizerConstants.calendarData.removeAll()
        var dayCounter = 1
        for _ in 1...numberOfDaysInMonth {
            let weekdayOffset = (weekdayIndex - 1 + dayCounter) % 7 // To handle the weekday offset, we subtract 1 from weekdayIndex
            let weekday = calendar.weekdaySymbols[weekdayOffset]
            TracerizerConstants.calendarData.append([weekday, "\(dayCounter)"])
            dayCounter += 1
        }

        datecollectionView.reloadData()
    }
    
    func buildHeirarchy() {
        view.addSubview(containerView)
        view.addSubview(upcomingCollectionView)
        view.addSubview(dateStackView)
        dateStackView.addArrangedSubview(currentMonthLabel)
        dateStackView.addArrangedSubview(currentdateLabel)
        view.addSubview(billStackView)
        billStackView.addArrangedSubview(totalBillLabel)
        billStackView.addArrangedSubview(totalBillSubTitleLabel)
        containerView.addSubview(settingButtton)
        containerView.addSubview(topLabel)
        containerView.addSubview(monthDropdownButton)
        containerView.addSubview(datecollectionView)
        containerView.addSubview(headTitleLabel)
        containerView.addSubview(headSubTitleLabel)
        containerView.addSubview(monthOptionsTableView)
    }
    
    func buildConstraints() {
        containerView.constrain(.height, constant: view.frame.height/2)
        containerView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        containerView.constrain(.topAnchor, to: view.topAnchor, constant: 0)
        dateStackView.constrain(.leadingAnchor, to: view.leadingAnchor, constant: 24)
        dateStackView.constrain(.topAnchor, to: containerView.bottomAnchor, constant: 24)
        billStackView.constrain(.trailingAnchor, to: view.trailingAnchor, constant: -24)
        billStackView.constrain(.topAnchor, to: containerView.bottomAnchor, constant: 24)
        upcomingCollectionView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        upcomingCollectionView.constrain(.bottomAnchor, to: view.bottomAnchor, constant: 0)
        upcomingCollectionView.constrain(.topAnchor, to: billStackView.bottomAnchor,constant: 24)
        settingButtton.constrainSize(width: 24, height: 24)
        settingButtton.constrain(.topAnchor,to: containerView.topAnchor, constant: 50)
        settingButtton.constrain(.trailingAnchor,to: containerView.trailingAnchor, constant: -25)
        topLabel.constrain(.topAnchor, to: containerView.topAnchor, constant: 50)
        topLabel.constrain(.centerXAnchor, to: containerView.centerXAnchor)
        datecollectionView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        
        headTitleLabel.constrain(.leadingAnchor, to: containerView.leadingAnchor, constant: 24)
        headSubTitleLabel.constrain(.leadingAnchor, to: containerView.leadingAnchor, constant: 24)
        headTitleLabel.constrain(.bottomAnchor, to: headSubTitleLabel.topAnchor, constant: -22)
        headSubTitleLabel
            .constrain(.bottomAnchor, to: datecollectionView.topAnchor, constant: -25)
        monthDropdownButton
            .constrain(.bottomAnchor, to: datecollectionView.topAnchor, constant: -25)
        monthDropdownButton.constrain(.trailingAnchor, to: containerView.trailingAnchor,constant: -24 )
        monthDropdownButton.constrainSize(width: 90, height: 32)
        monthOptionsTableView.constrain(.topAnchor, to: monthDropdownButton.bottomAnchor)
        monthOptionsTableView.constrain(.leadingAnchor, to: monthDropdownButton.leadingAnchor)
        monthOptionsTableView.constrain(.trailingAnchor, to: monthDropdownButton.trailingAnchor)
        monthOptionsTableView.constrain(.bottomAnchor, to: containerView.bottomAnchor)
        
    }
}


extension TRCalenderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == datecollectionView {
            return TracerizerConstants.calendarData.count
        } else {
           return viewModel.getNoOfRows(index: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var returncell = UICollectionViewCell()
        if collectionView == datecollectionView {
            guard let cell = datecollectionView.dequeueReusableCell(withReuseIdentifier: "TRDateDayCollectionViewCell", for: indexPath) as? TRDateDayCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.config(dateText: TracerizerConstants.calendarData[indexPath.item][1], dayText: TracerizerConstants.calendarData[indexPath.item][0])
            cell.layer.cornerRadius = containerView.frame.height * 0.04
            if selectedIndexPath == indexPath.row {
                cell.backgroundColor = .gray
                cell.dotView.backgroundColor = TrackerizerColorAssests.ButtonOrange.color
            } else {
                cell.backgroundColor = TrackerizerColorAssests.greyScale50.color
                cell.dotView.backgroundColor = .clear
            }
            returncell = cell
            return returncell
           
        } else {
            guard let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "TRUpcomingCollectionViewCell", for: indexPath) as? TRUpcomingCollectionViewCell else { return UICollectionViewCell()}
            let dataSource = viewModel.getData()
            cell.layer.cornerRadius = 16
            cell.config(iconImage: dataSource[0].data[indexPath.row].image, subsText: dataSource[0].data[indexPath.row].category, subscostText: dataSource[0].data[indexPath.row].price)
            returncell = cell
        }
        return returncell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == datecollectionView {
            selectedIndexPath = indexPath.row
            datecollectionView.reloadData()
        }
    }
}

extension TRCalenderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == datecollectionView {
            let width: CGFloat = collectionView.frame.width * 0.127
            let height: CGFloat = collectionView.frame.height - 15
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: (upcomingCollectionView.frame.width - 10) / 2, height: 168)
        }
    }
}

extension TRCalenderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TracerizerConstants.months.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = TracerizerConstants.months[indexPath.row]
        cell.textLabel?.textColor = TrackerizerColorAssests.greyScale30.color
        cell.backgroundColor =  TrackerizerColorAssests.GreyScale.color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedMonth = TracerizerConstants.months[indexPath.row]
        monthDropdownButton.setTitle(selectedMonth, for: .normal)
        monthOptionsTableView.isHidden = true
        let selectedMonthNumber = indexPath.row
        updateCalendarDataForSelectedMonth(month: selectedMonthNumber)
    }
}
