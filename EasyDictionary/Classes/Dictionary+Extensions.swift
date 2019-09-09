//
//  Dictionary+Extensions.swift
//  EasyDictionary
//
//  Created by Niels Koole on 03/05/2018.
//

import Foundation

public extension Dictionary where Key == String {
    
    enum ParseError: Error {
        case invalidKey(keyPath: String)
        case invalidDate(keyPath: String)
        case invalidTimeZone(keyPath: String)
        case invalidUrl(keyPath: String)
		
		public var localizedDescription: String {
			switch self {
			case .invalidKey(let keyPath): return "Invalid key: \(keyPath)"
			case .invalidDate(let keyPath): return "Invalid date: \(keyPath)"
			case .invalidTimeZone(let keyPath): return "Invalid timezone: \(keyPath)"
			case .invalidUrl(let keyPath): return "Invalid url: \(keyPath)"
			}
		}
    }
    
    func optional<T>(_ keyPath: String) -> T? {
        let value: T? = recursive(keyPath: keyPath, in: self)
        return value
    }
    
    func required<T>(_ keyPath: String) throws -> T {
        return try optional(keyPath).orThrow(ParseError.invalidKey(keyPath: keyPath))
    }
    
    func optionalDate(_ keyPath: String, formatter: DateFormatter) -> Date? {
        guard let dateString: String = optional(keyPath),
            let date = formatter.date(from: dateString)
            else { return nil }
        return date
    }
    
    func requiredDate(_ keyPath: String, formatter: DateFormatter) throws -> Date {
        return try optionalDate(keyPath, formatter: formatter).orThrow(ParseError.invalidDate(keyPath: keyPath))
    }
    
    func optionalTimeZone(_ keyPath: String) -> TimeZone? {
        guard let timeZoneString: String = optional(keyPath),
            let timeZone = TimeZone.from(dateString: timeZoneString)
            else { return nil }
        return timeZone
    }
    
    func requiredTimeZone(_ keyPath: String) throws -> TimeZone {
        return try optionalTimeZone(keyPath).orThrow(ParseError.invalidTimeZone(keyPath: keyPath))
    }
    
    func optionalUrl(_ keyPath: String, allowedCharacters: CharacterSet? = nil) -> URL? {
		guard var urlString: String = optional(keyPath) else { return nil }
		
		if let allowedCharacters = allowedCharacters {
			urlString = urlString.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? urlString
		}

		guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
	func requiredUrl(_ keyPath: String, allowedCharacters: CharacterSet? = nil) throws -> URL {
		return try optionalUrl(keyPath, allowedCharacters: allowedCharacters).orThrow(ParseError.invalidUrl(keyPath: keyPath))
    }
}

extension Dictionary where Key == String {
    
    private func recursive<T>(keyPath: String, in dict: [String: Any]) -> T? {
        let components = keyPath.components(separatedBy: ".")
        guard let firstKey = components.first else { return nil }
        
        if components.count == 1 {
            return dict[firstKey] as? T
        } else if components.count > 1,
            let newDict = dict[firstKey] as? [String: Any] {
            
            let newComponents = components.suffix(components.count - 1)
            let newPath = newComponents.reduce("") {
                guard !$0.isEmpty else { return $1 }
                return $0 + "." + $1
            }
            
            return recursive(keyPath: newPath, in: newDict)
        }
        
        return nil
    }
}
