//
//  Utilities.swift
//  final pj
//
//  Created by Kai on 11/30/23.
//

import Foundation
import UIKit
class Utilities {
    static func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("no url")
            completion(nil)
            return
        }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                print("no image data")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}

extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: max(0, r.lowerBound))
            let endIndex = self.index(startIndex, offsetBy: min(self.count - r.lowerBound, r.upperBound - r.lowerBound))

            return String(self[startIndex..<endIndex])
        }
    }
}

//let myString = "skldjfslkdjflksjfd"
//let substring = myString[0..<10]  // This will give you 'skldjfslkd'

