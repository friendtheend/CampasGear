//
//  ContactsTableViewCell.swift
//  WA8
//
//  Created by 郭 on 2023/11/15.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelProductTitle: UILabel!
    var labelDescription: UILabel!
    var labelPrice:UILabel!
    var imageProduct:UIImageView!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelProductTitle()
        setupLabelDescription()
        setupLabelPrice()
        setupImageProduct()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelProductTitle(){
        labelProductTitle = UILabel()
        labelProductTitle.font = UIFont.boldSystemFont(ofSize: 20)
        labelProductTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelProductTitle)
    }
    
    func setupLabelDescription(){
        labelDescription = UILabel()
        labelDescription.font = UIFont.boldSystemFont(ofSize: 15)
        labelDescription.textColor = .gray
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDescription)
    }
    
    func setupLabelPrice(){
        labelPrice = UILabel()
        labelPrice.font = UIFont.boldSystemFont(ofSize: 15)
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPrice)
    }
    
    func setupImageProduct(){
        imageProduct = UIImageView()
        imageProduct.contentMode = .scaleAspectFill // 设置内容模式
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
            
            labelProductTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            labelProductTitle.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor,constant: 16),
            labelProductTitle.heightAnchor.constraint(equalToConstant: 20),
            labelProductTitle.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelDescription.topAnchor.constraint(equalTo: labelProductTitle.bottomAnchor, constant: 10),
            labelDescription.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor, constant: 16),
            labelDescription.heightAnchor.constraint(equalToConstant: 20),
            labelDescription.trailingAnchor.constraint(equalTo: labelPrice.leadingAnchor, constant: -10),
            labelDescription.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelPrice.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            labelPrice.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
            labelPrice.heightAnchor.constraint(equalToConstant: 16),
            labelPrice.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
