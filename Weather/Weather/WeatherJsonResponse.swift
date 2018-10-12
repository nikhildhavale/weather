//
//  WeatherJsonResponse.swift
//  Weather
//
//  Created by Nikhil Modi on 10/12/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import Foundation
class WeatherResponse:Codable {
    var coord:Coordinate?
    var sys:SunInfo?
    var weather:[Weather]?
    var main:TempInfo?
    var wind:Wind?
    var rain:Rain?
    var clouds:Clouds?
    var dt:Int64?
    var id:Int64?
    var name:String?
    var cod:Int?
}
class Coordinate:Codable {
    var lat:Int?
    var lon:Int?
}
class SunInfo: Codable {
    var country:String?
    var sunrise:Int64?
    var sunset:Int64?
}
class Weather: Codable {
    var id:Int?
    var main:String?
    var description:String?
    var icon:String?
}
class TempInfo:Codable{
    var temp:Float?
    var humidity:Int?
    var pressure:Int?
    var temp_min:String?
    var temp_max:String?
}
class Wind:Codable{
    var speed:Float?
    var deg:Float?
}
class Rain:Codable {
    var h:Int?
    enum CodingKeys:String,CodingKey {
        case h = "3h"
    }
}
class Clouds:Codable{
    var all:Int?
}

