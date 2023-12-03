//
//  UserInfo.swift
//  final pj
//
//  Created by Kai on 11/30/23.
//

import Foundation
struct UserInfo {
    var userId: String
    var userName: String
    var email: String
    var school: String
    var imageUrl: String
    var phoneNum: String
    var address: String

    init?(dictionary: [String: Any]) {
        guard let userName = dictionary["userName"] as? String,
              let userId = dictionary["userId"] as? String,
              let email = dictionary["email"] as? String,
              let school = dictionary["school"] as? String,
              let imageUrl = dictionary["imageUrl"] as? String,
              let phoneNum = dictionary["phoneNum"] as? String,
              let address = dictionary["address"] as? String else {
            return nil
        }

        self.userName = userName
        self.userId = userId
        self.email = email
        self.school = school
        self.imageUrl = imageUrl
        self.phoneNum = phoneNum
        self.address = address
        
    }
}

