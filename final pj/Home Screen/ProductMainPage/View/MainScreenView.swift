//
//  MainScreen.swift
//  WA8
//
//  Created by 郭 on 2023/11/17.
//

import UIKit

class MainScreenView: UIView{
    
    var contentWrapper: UIScrollView!
    var stack:  UIStackView!
    var tableViewProductLists: UITableView!
    var labelCampusGear: UILabel!
    var pickerSchool: UIPickerView!
    var buttonAppliances: UIButton!
    var buttonBook: UIButton!
    var buttonBeauty: UIButton!
    var buttonOther: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()
        setupStack()
        setupLabelCampusGear()
        setupTableViewProduct()
        setupPickerViewSchool()
        setupButtonAppliances()
        setupButtonBook()
        setupButtonBeauty()
        setupButtonOther()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupStack(){
        stack = UIStackView()
        stack.axis = .horizontal//the stack grows horizontally...
        //stack.alignment = .center // Useful for vertical stacks. The stack will be centrally aligned
        stack.distribution = .fillProportionally //make spaces in between UI elements proportionately and automatically...
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stack)
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
        tableViewProductLists.register(ProductTableViewCell.self, forCellReuseIdentifier: Configs.tableViewProductsID) //修改为firebase里面的product id
        tableViewProductLists.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewProductLists)
    }
    
    func setupPickerViewSchool() {
        pickerSchool = UIPickerView()
        pickerSchool.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerSchool)
    }
    
    func setupButtonAppliances(){
        buttonAppliances = UIButton(type: .system)
//        button1.setImage(.add, for: .normal)
        buttonAppliances.setTitle("Appliances", for: .normal)
        buttonAppliances.titleLabel?.font = .boldSystemFont(ofSize: 15)
//        buttonAppliances.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(buttonAppliances)
    }
    
    func setupButtonBook(){
        buttonBook = UIButton(type: .system)
        buttonBook.setTitle("Books", for: .normal)
        buttonBook.titleLabel?.font = .boldSystemFont(ofSize: 15)
//        buttonBook.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(buttonBook)
    }
    
    func setupButtonBeauty(){
        buttonBeauty = UIButton(type: .system)
        buttonBeauty.setTitle("Beautys", for: .normal)
        buttonBeauty.titleLabel?.font = .boldSystemFont(ofSize: 15)
//        buttonBeauty.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(buttonBeauty)
    }
    
    func setupButtonOther(){
        buttonOther = UIButton(type: .system)
        buttonOther.setTitle("Others", for: .normal)
        buttonOther.titleLabel?.font = .boldSystemFont(ofSize: 15)
//        buttonOther.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(buttonOther)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
//            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
//            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            labelCampusGear.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            labelCampusGear.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            pickerSchool.topAnchor.constraint(equalTo: labelCampusGear.bottomAnchor),
            pickerSchool.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            pickerSchool.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            pickerSchool.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            pickerSchool.heightAnchor.constraint(equalToConstant: 200),
            
            stack.topAnchor.constraint(equalTo: pickerSchool.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stack.heightAnchor.constraint(equalToConstant: 50),
     
            tableViewProductLists.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 10),
            tableViewProductLists.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            tableViewProductLists.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableViewProductLists.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

      ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
