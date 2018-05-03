//
//  String+Extensions.swift
//  EasyDictionary
//
//  Created by Niels Koole on 03/05/2018.
//

import Foundation

extension String {
    func substring(from range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
}
