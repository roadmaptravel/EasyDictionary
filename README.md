# EasyDictionary

[![CI Status](http://img.shields.io/travis/bynelus/EasyDependency.svg?style=flat)](https://travis-ci.org/roadmaptravel/EasyDictionary)
[![Version](https://img.shields.io/cocoapods/v/EasyDependency.svg?style=flat)](http://cocoapods.org/pods/EasyDictionary)
[![License](https://img.shields.io/cocoapods/l/EasyDependency.svg?style=flat)](http://cocoapods.org/pods/EasyDictionary)
[![Platform](https://img.shields.io/cocoapods/p/EasyDependency.svg?style=flat)](http://cocoapods.org/pods/EasyDictionary)
[![Twitter](https://img.shields.io/twitter/follow/roadmaptravel.svg?style=social&label=Follow)](http://twitter.com/roadmaptravel)

- [Installation](#installation)
- [Usage](#usage)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Swift 4.0

## Installation

EasyDictionary is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyDictionary'
```

## Summary

This little helper provides some methods to get optional and non-optional values from your dictionary. This can be used anywhere, but we use it mostly to parse data from an endpoint into an object.

## Features

- [x] Generic way of getting types from a dictionary.
- [x] Parse urls directly.
- [x] Parse dates directly.
- [x] Parse timezones from a date string. (of course since we build THE travel app ;-)
- [ ] Any more requests?

## Usage

### Retrieve the data

```swift
import EasyDictionary

let dictionary: [String: Any] = [
    "anInteger": 42,
    "originDate": "2018-05-03T07:15:00+02:00",
    "notJustAnUrl": "https://www.getroadmap.com/"
]

/// Get the integer from the dictionary.
let answerToEverything: Int = try dictionary.required("anInteger") // 42
let answerToEverything: Int? = dictionary.optional("anInteger") // Optional(42)
let answerToEverything: Int = try dictionary.required("doesntExists") // throws error!!

/// Get the url from the dictionary.
let bestTravelApp: URL = try dictionary.requiredUrl("notJustAnUrl") // https://www.getroadmap.com/
let bestTravelApp: URL? = dictionary.optionalUrl("notJustAnUrl") // Optional(https://www.getroadmap.com/)
let bestTravelApp: URL = try dictionary.requiredUrl("doesntExists") // throws error!!

/// Get the date from the dictionary
let dateFormatter: DateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"

let originsDate: Date = try dictionary.requiredDate("originDate", dateFormatter: dateFormatter) // 1525324500
let originsDate: Date? = dictionary.optionalDate("originDate", dateFormatter: dateFormatter) // Optional(1525324500)
let originsDate: Date = try dictionary.requiredDate("doesntExists", dateFormatter: dateFormatter) // throws error!!
```

## Author

Niels Koole, Roadmap ([Twitter](https://twitter.com/roadmaptravel))

## License

EasyDictionary is available under the MIT license. See the LICENSE file for more info.
