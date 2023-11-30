//
//  MyProfileView.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/29.
//

import UIKit

class MyProfileView: UIView {

    var imagePhoto:UIImageView!
    var labelUserName:UILabel!
    var buttonEdit:UIButton!
    var buttonMyPost:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupImagePhoto()
        setupLabelUserName()
        setupButtonEdit()
        setupButtonMyPost()
        
        initConstraints()
    }
    
    func setupImagePhoto(){
        imagePhoto = UIImageView(image: UIImage(named: "Logo")) //firebase个人头像
        imagePhoto.contentMode = .scaleAspectFit
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePhoto)
    }
    
    func setupLabelUserName(){
        labelUserName = UILabel()
        labelUserName.text = "Username" //firebase 用户名
        labelUserName.font = UIFont.boldSystemFont(ofSize: 16)
        labelUserName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelUserName)

    }

    func setupButtonEdit(){
        buttonEdit = UIButton(type: .system)
        buttonEdit.setTitle("Edit my profile", for: .normal)
        buttonEdit.titleLabel?.font = .boldSystemFont(ofSize: 23)
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonEdit)
    }
    func setupButtonMyPost(){
        buttonMyPost = UIButton(type: .system)
        buttonMyPost.setTitle("My Post", for: .normal)
        buttonMyPost.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonMyPost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonMyPost)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            imagePhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -50),
            imagePhoto.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            imagePhoto.widthAnchor.constraint(equalToConstant: 60),
            imagePhoto.heightAnchor.constraint(equalToConstant: 60),
        
            labelUserName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -50),
            labelUserName.leadingAnchor.constraint(equalTo: imagePhoto.leadingAnchor,constant: 20),

            buttonEdit.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor,constant: 50),
            buttonEdit.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            
            buttonMyPost.topAnchor.constraint(equalTo: buttonEdit.bottomAnchor,constant: 20),
            buttonMyPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20)
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
