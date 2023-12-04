//
//  ClickCategoryView.swift
//  final pj
//
//  Created by 郭 on 2023/12/4.
//

import UIKit

class ClickCategoryView: UIView {

    var contentWrapper: UIScrollView!
    var tableViewProductLists: UITableView!
    var labelCampusGear: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()
        setupLabelCampusGear()
        setupTableViewProduct()
 
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabelCampusGear() {
        labelCampusGear = UILabel()
        labelCampusGear.text = "CampusGear"
        labelCampusGear.font = UIFont.boldSystemFont(ofSize: 25)
        labelCampusGear.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCampusGear)
    }
    
    func setupTableViewProduct(){
        tableViewProductLists = UITableView()
        tableViewProductLists.register(CategoryTableViewCell.self, forCellReuseIdentifier: Configs.tableViewCategoryID) //修改为firebase里面的product id
        tableViewProductLists.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewProductLists)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelCampusGear.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            labelCampusGear.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tableViewProductLists.topAnchor.constraint(equalTo: labelCampusGear.bottomAnchor, constant: 36),
            tableViewProductLists.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            tableViewProductLists.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableViewProductLists.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

      ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
