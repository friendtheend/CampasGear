//
//  ProductDetailScreen.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/30.
//

import UIKit

class ProductDetailView: UIView {

    var contentWrapper: UIScrollView!
    
    var labelTitle: UILabel!
    var imagePhoto: UIImageView!
    var labelPrice: UILabel!
    var labelDescribe: UILabel!
    var labelInfo: UILabel!
    var labelSeller: UILabel!

    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()
        
        setupLabelTitle()
        setupLabelInfo()
        setupImagePhoto()
        setupLabelPrice()
        setupLabelDescribe()
        setupLabelSeller()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabelTitle() {
        labelTitle = UILabel()
        labelTitle.text = "Product Title"
        labelTitle.font = UIFont.systemFont(ofSize: 25)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelTitle)
    }
    
    func setupImagePhoto(){
        imagePhoto = UIImageView(image: UIImage(named: "Logo"))
        imagePhoto.contentMode = .scaleAspectFit
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(imagePhoto)
    }
    
    func setupLabelDescribe() {
        labelDescribe = UILabel()
        labelDescribe.text = "Seller's Description: "
        labelDescribe.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelDescribe)
    }
    
    func setupLabelInfo() {
        labelInfo = UILabel()
        labelInfo.text = "Contact Info: "
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelInfo)
    }
    
    func setupLabelPrice() {
        labelPrice = UILabel()
        labelPrice.text = "$"
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPrice)
    }
    
    func setupLabelSeller() {
        labelSeller = UILabel()
        labelSeller.text = "From: "
        labelSeller.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelSeller)
    }
 
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor), //new
            
            labelTitle.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: -5),
            labelTitle.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
 
            imagePhoto.topAnchor.constraint(equalTo: labelTitle.topAnchor, constant: 30),
            imagePhoto.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            imagePhoto.widthAnchor.constraint(equalToConstant: 150),
            imagePhoto.heightAnchor.constraint(equalToConstant: 150),
            
            labelPrice.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor, constant: 3),
            labelPrice.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelDescribe.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: 30),
            labelDescribe.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 10),
            
            labelInfo.topAnchor.constraint(equalTo: labelDescribe.bottomAnchor, constant: 30),
            labelInfo.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 10),
            
            labelSeller.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: 50),
            labelSeller.leadingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 200),
            labelSeller.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -15),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
