//
//  MyProfileView.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/29.
//

import UIKit

class MyProfileView: UIView {

    var contentWrapper: UIScrollView! //new
    
    var imagePic:UIImageView!
    var buttonEdit: UIButton!
    var labelUsername: UILabel!
    var buttonMyPost: UIButton!
    var buttonRightArrow: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()
        
        setupImagePic()
        setupButtonRightArrow()
        setupButtonMyPost()
        setupButtonEdit()
        setupLabelSchool()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupImagePic(){
        imagePic = UIImageView(image: UIImage(named: "Logo"))
        imagePic.contentMode = .scaleAspectFill
        imagePic.layer.cornerRadius = 5 // 设置圆角为 10 像素
        imagePic.clipsToBounds = true
        imagePic.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(imagePic)
    }
    
    func setupButtonMyPost(){
        buttonMyPost = UIButton(type: .system)
        buttonMyPost.setTitle("My Post", for: .normal)
        buttonMyPost.titleLabel?.font = .boldSystemFont(ofSize: 21)
        buttonMyPost.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonMyPost)
    }
    
    func setupLabelSchool() {
        labelUsername = UILabel()
        labelUsername.text = "username"
        labelUsername.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelUsername)
    }

    
    func setupButtonEdit(){
        buttonEdit = UIButton(type: .system)
        buttonEdit.setTitle("Edit My Profile", for: .normal)
        buttonEdit.titleLabel?.font = .boldSystemFont(ofSize: 21)
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonEdit)
    }
    
    func setupButtonRightArrow() {
            buttonRightArrow = UIButton(type: .system)
            buttonRightArrow.setImage(UIImage(systemName: "arrow.right"), for: .normal) // Using a system image for the right arrow
            buttonRightArrow.translatesAutoresizingMaskIntoConstraints = false
            contentWrapper.addSubview(buttonRightArrow)
            
            //buttonRightArrow.addTarget(self, action: #selector(rightArrowTapped), for: .touchUpInside) // Adding an action
        }
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor), //new
            
            imagePic.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            imagePic.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor,constant: 20),
            imagePic.widthAnchor.constraint(equalToConstant: 100),
            imagePic.heightAnchor.constraint(equalToConstant: 100),
            
            labelUsername.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 65),
            labelUsername.leadingAnchor.constraint(equalTo: imagePic.leadingAnchor,constant: 120),
            //labelUsername.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonRightArrow.centerYAnchor.constraint(equalTo: labelUsername.centerYAnchor),
            buttonRightArrow.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //buttonRightArrow.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            buttonRightArrow.widthAnchor.constraint(equalToConstant: 30),
            buttonRightArrow.heightAnchor.constraint(equalToConstant: 30),
            
            buttonEdit.topAnchor.constraint(equalTo: imagePic.bottomAnchor, constant: 50),
            buttonEdit.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor,constant: 25),
            
            buttonMyPost.topAnchor.constraint(equalTo: buttonEdit.bottomAnchor, constant: 32),
            buttonMyPost.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor,constant: 25),
            buttonMyPost.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -15),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
