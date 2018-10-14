//
//  Enum.swift
//  Weather
//
//  Created by Nikhil Modi on 10/14/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import Foundation
enum Location:Int{
    case Sydney = 4163971
    case Melbourne = 2147714
    case Brisbane = 2174003
    static let locationId = [Location.Sydney.rawValue,Location.Melbourne.rawValue,Location.Brisbane.rawValue]
}
enum Section:Int {
    case main = 0
    case temp = 1
    case sun = 2
    case humidity = 3
    case pressure = 4
    case wind = 5
    case rains = 6
}


