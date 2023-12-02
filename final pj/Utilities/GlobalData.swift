//
//  GlobalData.swift
//  final pj
//
//  Created by Kai on 11/30/23.
//

import Foundation
class GlobalData {
    static let shared = GlobalData()
    var userInfo: UserInfo?
    private init() {}
}
