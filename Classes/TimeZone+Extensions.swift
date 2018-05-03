//
//  TimeZone+Extensions.swift
//  EasyDictionary
//
//  Created by Niels Koole on 03/05/2018.
//

import Foundation

public extension TimeZone {
    public static func from(string: String) -> TimeZone? {
        let timeZoneString = String(string.suffix(6))
        guard timeZoneString.count == 6 else { return nil }
        
        let hoursString = timeZoneString.substring(from: 1..<3)
        let hoursInt = Int(hoursString) ?? 0
        
        let minutesString = timeZoneString.substring(from: 4..<6)
        let minutesInt = Int(minutesString) ?? 0
        
        let interval = (hoursInt * 3600) + (minutesInt * 60)
        
        return timeZoneString.prefix(1) == "+" ? TimeZone(secondsFromGMT: interval) : TimeZone(secondsFromGMT: -interval)
    }
}
