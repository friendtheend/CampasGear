//
//  MainScreen.swift
//  WA8
//
//  Created by 郭 on 2023/11/17.
//

import UIKit

class MainScreenView: UIView{
    
    var tableViewProductLists: UITableView!
    var labelCampusGear: UILabel!
    var pickerSchool: UIPickerView!
    var buttonAppliances: UIButton!
    var buttonBook: UIButton!
    var buttonBeauty: UIButton!
    var buttonOther: UIButton!
    
    var buttonMyprofile:UIButton!//临时代替下方的导航栏
    var buttonCreate:UIButton!//临时

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupLabelCampusGear()
        setupTableViewProduct()
        setupPickerViewSchool()
        setupButtonAppliances()
        setupButtonBook()
        setupButtonBeauty()
        setupButtonOther()
        setupButtonMyprofile()
        setupButtonCreate()
        
        initConstraints()
    }
    

    func setupTableViewProduct(){
        tableViewProductLists = UITableView()
       // tableViewProductLists.register(ProductTableViewCell.self, forCellReuseIdentifier: Configs.tableViewContactsID) //修改为firebase里面的product id
        tableViewProductLists.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewProductLists)
    }

    func setupLabelCampusGear() {
        labelCampusGear = UILabel()
        labelCampusGear.text = "CampusGear"
        labelCampusGear.font = UIFont.boldSystemFont(ofSize: 25)
        labelCampusGear.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCampusGear)
    }
    
    func setupPickerViewSchool() {
        pickerSchool = UIPickerView()
        pickerSchool.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerSchool)
    }
    
    func setupButtonAppliances(){
        buttonAppliances = UIButton(type: .system)
        buttonAppliances.setTitle("Appliances", for: .normal)
        buttonAppliances.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonAppliances.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAppliances)
    }
    
    func setupButtonBook(){
        buttonBook = UIButton(type: .system)
        buttonBook.setTitle("Books", for: .normal)
        buttonBook.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonBook.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonBook)
    }
    
    func setupButtonBeauty(){
        buttonBeauty = UIButton(type: .system)
        buttonBeauty.setTitle("Beautys", for: .normal)
        buttonBeauty.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonBeauty.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonBeauty)
    }
    
    func setupButtonOther(){
        buttonOther = UIButton(type: .system)
        buttonOther.setTitle("Others", for: .normal)
        buttonOther.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonOther.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonOther)
    }
    
    func setupButtonMyprofile(){
        buttonMyprofile = UIButton(type: .system)
        buttonMyprofile.setTitle("My Profile", for: .normal)
        buttonMyprofile.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonMyprofile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonMyprofile)
    }
    func setupButtonCreate(){
        buttonCreate = UIButton(type: .system)
        buttonCreate.setTitle("Create product", for: .normal)
        buttonCreate.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonCreate.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonCreate)
    }
    
    func initConstraints(){
        let spacing: CGFloat = 16 // 设置按钮之间的间距
        NSLayoutConstraint.activate([
            labelCampusGear.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -50),
            labelCampusGear.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            pickerSchool.topAnchor.constraint(equalTo: labelCampusGear.bottomAnchor, constant: -25),
            pickerSchool.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonAppliances.topAnchor.constraint(equalTo: pickerSchool.bottomAnchor, constant: -25),
            buttonAppliances.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: spacing),
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
            buttonOther.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -spacing),
            
            tableViewProductLists.topAnchor.constraint(equalTo: buttonBook.bottomAnchor, constant: 10),
            tableViewProductLists.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
//            tableViewProductLists.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
//            tableViewProductLists.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            
            buttonMyprofile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            buttonMyprofile.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -90),
            
            buttonCreate.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),

      ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
