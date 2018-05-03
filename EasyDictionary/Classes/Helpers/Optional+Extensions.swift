//
//  Optional+Extensions.swift
//  EasyDictionary
//
//  Created by Niels Koole on 03/05/2018.
//

import Foundation

/// This code is from John Sundell, but I'm not sure where I got it from.. 😅
/// See his work at: https://github.com/JohnSundell
extension Optional {
    func orThrow<E: Error>(_ errorClosure: @autoclosure () -> E) throws -> Wrapped {
        guard let value = self else { throw errorClosure() }
        return value
    }
}
