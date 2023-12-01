//
//  MainScreen.swift
//  WA8
//
//  Created by 郭 on 2023/11/17.
//

import UIKit

class MainScreenView: UIView{
    
    var contentWrapper: UIScrollView!
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
    
    func setupTableViewProduct(){
        tableViewProductLists = UITableView()
       // tableViewProductLists.register(ProductTableViewCell.self, forCellReuseIdentifier: Configs.tableViewContactsID) //修改为firebase里面的product id
        tableViewProductLists.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(tableViewProductLists)
    }

    func setupLabelCampusGear() {
        labelCampusGear = UILabel()
        labelCampusGear.text = "CampusGear"
        labelCampusGear.font = UIFont.boldSystemFont(ofSize: 25)
        labelCampusGear.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelCampusGear)
    }
    
    func setupPickerViewSchool() {
        pickerSchool = UIPickerView()
        pickerSchool.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(pickerSchool)
    }
    
    func setupButtonAppliances(){
        buttonAppliances = UIButton(type: .system)
        buttonAppliances.setTitle("Appliances", for: .normal)
        buttonAppliances.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonAppliances.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonAppliances)
    }
    
    func setupButtonBook(){
        buttonBook = UIButton(type: .system)
        buttonBook.setTitle("Books", for: .normal)
        buttonBook.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonBook.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonBook)
    }
    
    func setupButtonBeauty(){
        buttonBeauty = UIButton(type: .system)
        buttonBeauty.setTitle("Beautys", for: .normal)
        buttonBeauty.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonBeauty.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonBeauty)
    }
    
    func setupButtonOther(){
        buttonOther = UIButton(type: .system)
        buttonOther.setTitle("Others", for: .normal)
        buttonOther.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonOther.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonOther)
    }
    
    func initConstraints(){
        let spacing: CGFloat = 16 // 设置按钮之间的间距
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor), 
            
            labelCampusGear.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: -6),
            labelCampusGear.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            pickerSchool.topAnchor.constraint(equalTo: labelCampusGear.bottomAnchor, constant: -25),
            pickerSchool.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            buttonAppliances.topAnchor.constraint(equalTo: pickerSchool.bottomAnchor, constant: -25),
            buttonAppliances.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: spacing),
            buttonAppliances.widthAnchor.constraint(equalToConstant: 80),

            buttonBook.topAnchor.constraint(equalTo: pickerSchool.bottomAnchor, constant: -25),
            buttonBook.leadingAnchor.constraint(equalTo: buttonAppliances.trailingAnchor, constant: spacing),
            buttonBook.widthAnchor.constraint(equalToConstant: 80),

            buttonBeauty.topAnchor.constraint(equalTo: pickerSchool.bottomAnchor, constant: -25),
            buttonBeauty.leadingAnchor.constraint(equalTo: buttonBook.trailingAnchor, constant: spacing),
            buttonBeauty.widthAnchor.constraint(equalToConstant: 80),

            buttonOther.topAnchor.constraint(equalTo: pickerSchool.bottomAnchor, constant: -25),
            buttonOther.leadingAnchor.constraint(equalTo: buttonBeauty.trailingAnchor, constant: spacing),
            buttonOther.widthAnchor.constraint(equalToConstant: 80),
            buttonOther.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -spacing),
            
            tableViewProductLists.topAnchor.constraint(equalTo: buttonBook.bottomAnchor, constant: 10),
            tableViewProductLists.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            tableViewProductLists.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -15),
//            tableViewProductLists.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
//            tableViewProductLists.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),

      ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
