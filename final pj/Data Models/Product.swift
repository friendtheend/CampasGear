//
//  Product.swift
//  final pj
//
//  Created by 郭 on 2023/12/1.
//

import Foundation

struct product: Codable{
    var documentID: String?
    var title: String
    var category: String
    var describe: String
    var price:Int
    var contactInfo: String
    var imagePath: String
    var seller: String
    var hasSold: Bool
    var creationDate: Date?
    
    init(title: String, category:String, describe: String, price:Int, contactInfo:String, imagePath:String,seller: String, hasSold: Bool, creationDate:Date?) {
        self.title = title
        self.category = category
        self.describe = describe
        self.price = price
        self.contactInfo = contactInfo
        self.imagePath = imagePath
        self.seller = seller
        self.hasSold = hasSold
        self.creationDate = creationDate
    }
}
