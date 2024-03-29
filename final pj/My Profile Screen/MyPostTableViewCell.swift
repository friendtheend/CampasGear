//
//  MyPostTableViewCell.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/12/1.
//

import UIKit

class MyPostTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    
//    var buttonEdit: UIButton!
//    var buttonDelete: UIButton!
    var labelProductTitle: UILabel!
    var labelStatus: UILabel!
    var labelPrice:UILabel!
    var labelDesc:UILabel!
    var imageProduct:UIImageView!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        
//        setupButtonEdit()
//        setupButtonDelete()
        setupLabelProductTitle()
        setupLabelStatus()
        setupLabelPrice()
        setupLabelDesc()
        setupImageProduct()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
//    func setupButtonDelete(){
//        buttonDelete = UIButton(type: .system)
//        buttonDelete.setTitle("Delete", for: .normal)
//        buttonDelete.titleLabel?.font = .boldSystemFont(ofSize: 16)
//        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
//        wrapperCellView.addSubview(buttonDelete)
//    }
//    
//    func setupButtonEdit(){
//        buttonEdit = UIButton(type: .system)
//        buttonEdit.setTitle("Change Status", for: .normal)
//        buttonEdit.titleLabel?.font = .boldSystemFont(ofSize: 16)
//        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
//        wrapperCellView.addSubview(buttonEdit)
//    }
    
    func setupLabelProductTitle(){
        labelProductTitle = UILabel()
        labelProductTitle.font = UIFont.boldSystemFont(ofSize: 20)
        labelProductTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelProductTitle)
    }
    
    func setupLabelStatus(){
        labelStatus = UILabel()
        labelStatus.font = UIFont.boldSystemFont(ofSize: 12)
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelStatus)
    }
    
    func setupLabelPrice(){
        labelPrice = UILabel()
        labelPrice.font = UIFont.boldSystemFont(ofSize: 14)
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPrice)
    }
    func setupLabelDesc(){
        labelDesc = UILabel()
        labelDesc.font = UIFont.boldSystemFont(ofSize: 12)
        labelDesc.textColor = .gray
        labelDesc.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDesc)
    }
    
    func setupImageProduct(){
        imageProduct = UIImageView(image: UIImage(systemName: "bag.fill"))
        imageProduct.contentMode = .scaleToFill
        imageProduct.layer.cornerRadius = 5 // 设置圆角为 10 像素
        imageProduct.clipsToBounds = true
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageProduct)
    }

    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            imageProduct.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            imageProduct.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            imageProduct.widthAnchor.constraint(equalToConstant: 50),
            imageProduct.heightAnchor.constraint(equalToConstant: 50),
            
            labelProductTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 15),
            labelProductTitle.leadingAnchor.constraint(equalTo: imageProduct.leadingAnchor, constant: 70),
            labelProductTitle.heightAnchor.constraint(equalToConstant: 16),
            labelProductTitle.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelDesc.topAnchor.constraint(equalTo: labelProductTitle.bottomAnchor, constant: 15),
            labelDesc.leadingAnchor.constraint(equalTo: imageProduct.leadingAnchor, constant: 70),
            labelDesc.heightAnchor.constraint(equalToConstant: 16),
            labelDesc.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelStatus.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 15),
            labelStatus.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -15),
            labelStatus.heightAnchor.constraint(equalToConstant: 16),
            labelStatus.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelPrice.topAnchor.constraint(equalTo: labelProductTitle.bottomAnchor, constant: 15),
            labelPrice.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -15),
            labelPrice.heightAnchor.constraint(equalToConstant: 16),
            labelPrice.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
//            buttonEdit.topAnchor.constraint(equalTo: labelProductTitle.bottomAnchor, constant: 15),
//            buttonEdit.leadingAnchor.constraint(equalTo: imageProduct.leadingAnchor, constant: 70),
//            buttonEdit.heightAnchor.constraint(equalToConstant: 12),
//            buttonEdit.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
//            
//            buttonDelete.topAnchor.constraint(equalTo: buttonEdit.bottomAnchor, constant: 5),
//            buttonDelete.leadingAnchor.constraint(equalTo: imageProduct.leadingAnchor, constant: 70),
//            buttonDelete.heightAnchor.constraint(equalToConstant: 12),
//            buttonDelete.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
