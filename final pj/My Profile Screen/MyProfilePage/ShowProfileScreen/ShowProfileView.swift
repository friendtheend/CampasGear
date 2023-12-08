//
//  ShowProfileView.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/30.
//

import UIKit

class ShowProfileView: UIView {

    var contentWrapper: UIScrollView! //new
    
    var imagePic: UIImageView!
    var labelUsername: UILabel!
    var labelPhone: UILabel!
    var labelSchool: UILabel!
    var labelEmail: UILabel!
    var labelAddress: UILabel!

    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()

        setupImagePic()
        setupLabelUserName()
        setupLabelPhone()
        setupLabelSchool()
        setupLabelEmail()
        setupLabelAddress()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupImagePic(){
        imagePic = UIImageView(image: UIImage(systemName: "person.fill"))
        imagePic.contentMode = .scaleAspectFill
        imagePic.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(imagePic)
    }
  
    func setupLabelUserName() {
        labelUsername = UILabel()
        labelUsername.text = "Username:"
        labelUsername.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelUsername)
    }
 
    func setupLabelPhone() {
        labelPhone = UILabel()
        labelPhone.text = "Phone:"
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPhone)
    }
    func setupLabelSchool() {
        labelSchool = UILabel()
        labelSchool.text = "School:"
        labelSchool.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelSchool)
    }
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "Email:"
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmail)
    }
    
    func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.text = "Address:"
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelAddress)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            imagePic.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: -15),
            imagePic.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            imagePic.widthAnchor.constraint(equalToConstant: 100),
            imagePic.heightAnchor.constraint(equalToConstant: 100),
            
            labelUsername.topAnchor.constraint(equalTo: imagePic.bottomAnchor, constant: 50),
            labelUsername.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelUsername.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            labelPhone.topAnchor.constraint(equalTo: labelUsername.bottomAnchor, constant: 20),
            labelPhone.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelPhone.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            labelSchool.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 20),
            labelSchool.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelSchool.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            labelEmail.topAnchor.constraint(equalTo: labelSchool.bottomAnchor, constant: 20),
            labelEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelEmail.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            labelAddress.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 20),
            labelAddress.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelAddress.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            labelAddress.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -15),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
