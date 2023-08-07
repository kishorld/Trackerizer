//
//  SpendingAndBudgetViewController.swift
//  Trackerizer
//
//  Created by Kishor LD on 27/06/23.
//

import UIKit

class TRSpendingAndBudgetViewController: UIViewController {
    
    
    private let viewModel = TRSpendingAndBudgetViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getSpendingAndBudgetData()
        self.navigationController?.isNavigationBarHidden = true
        build()
        circularProgreessView.backgroundColor = .red
        tableView.reloadData()
        tableView.register(TRDataInfoTableViewCell.self, forCellReuseIdentifier: "BudgetCell")
        tableView.register(TRAddNewCategoryTableViewCell.self, forCellReuseIdentifier: "AddCategoryCell")
    }
    //
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cellView.layer.cornerRadius = cellView.frame.size.height / 4
    }
    //
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //
    //    }
    private lazy var  tableView: UITableView = {
        let table = IOComponent.createTableView(style: .plain,seperatorStyle: .none)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    func build() {
        view.backgroundColor = TrackerizerColorAssests.AppBackGround.color
        
        buildHeirarchy()
        buildConstraints()
    }
    
    lazy var circularProgreessView = CustomSpendingProgressBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    
    private let settingButtton: UIButton = {
        let btn = IOComponent.createCustomButton(image:TrackerizerImageAssests.setting.image)
        return btn
    }()
    
    
    
    private let topLabel: UILabel = {
        let label = IOComponent.createLabel(text: "Spending & Budgets")
        label.font =  UIFont(name: TrackerizerFontAssests.interRegular.font, size: 16)
        label.textColor = TrackerizerColorAssests.greyScale30.color
        return label
    }()
    
    private let cellabel: UILabel = {
        let label = IOComponent.createLabel(text: "Your budgets are on track")
        label.font =  UIFont(name: TrackerizerFontAssests.interSemiBold.font, size: 14)
        label.textColor = TrackerizerColorAssests.ButonWhite.color
        return label
        
    }()
    
    private let celImag: UIImageView = {
        let image = IOComponent.createImageView(image:TrackerizerImageAssests.Group.image, contentMode: .scaleAspectFit)
        return image
    }()
    
    private let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let cellStack:  UIStackView = {
        let stack = IOComponent.createStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 4)
        return stack
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.layer.borderColor = TrackerizerColorAssests.dottedGreyScale60.color.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    func buildHeirarchy() {
        view.addSubview(topView)
        view.addSubview(tableView)
        topView.addSubview(settingButtton)
        topView.addSubview(topLabel)
        topView.addSubview(cellView)
        topView.addSubview(circularProgreessView)
        cellView.addSubview(cellStack)
        cellStack.addArrangedSubview(cellabel)
        cellStack.addArrangedSubview(celImag)
        
    }
    
    func buildConstraints()  {
        topView.constrain(.topAnchor,to: view.topAnchor, constant: 0)
        topView.constrain(.heightAnchor, constant: view.frame.height * 0.40)
        topView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 0))
        circularProgreessView.translatesAutoresizingMaskIntoConstraints = false
        settingButtton.constrainSize(width: 24, height: 24)
        settingButtton.constrain(.topAnchor,to: topView.topAnchor, constant: 50)
        settingButtton.constrain(.trailingAnchor,to: topView.trailingAnchor, constant: -25)
        topLabel.constrain(.centerXAnchor, to: topView.centerXAnchor)
        topLabel.constrain(.topAnchor, to: topView.topAnchor, constant: 50)
        cellView.constrain(.bottomAnchor, to: topView.bottomAnchor, constant: -10)
        cellView.constrainEdges(.horizontal, with: .init(leadingAndTrailing: 24))
        cellView.constrain(.heightAnchor, constant: view.frame.height * 0.08)
        circularProgreessView.constrain(.centerXAnchor, to: topView.centerXAnchor)
        circularProgreessView.constrain(.topAnchor, to: topLabel.bottomAnchor, constant: view.frame.height * 0.17)
       
        tableView.constrainEdges(.horizontal,  with: .init(leadingAndTrailing: 0))
        tableView.constrain(.topAnchor,to: topView.bottomAnchor, constant: 0)
        tableView.constrain(.bottomAnchor,to: view.bottomAnchor, constant: 0)
        cellStack.constrain(.centerXAnchor, to: cellView.centerXAnchor)
        cellStack.constrain(.centerYAnchor, to: cellView.centerYAnchor)
    }
}

extension TRSpendingAndBudgetViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNoOfcell() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 3 {
         
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetCell", for: indexPath) as? TRDataInfoTableViewCell else {
                return UITableViewCell()
            }
            let dataSource = viewModel.getData()
            cell.configure(image: dataSource[indexPath.row].image, iconText: dataSource[indexPath.row].category , iconCost: dataSource[indexPath.row].price , icontextDesc: dataSource[indexPath.row].remaining , iconCostDesc: dataSource[indexPath.row].total ,ProgressColor: dataSource[indexPath.row].color, progressValue: dataSource[indexPath.row].percentage )
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddCategoryCell", for: indexPath)  as? TRAddNewCategoryTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    
}
