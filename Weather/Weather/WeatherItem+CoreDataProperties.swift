//
//  WeatherItem+CoreDataProperties.swift
//  Weather
//
//  Created by Nikhil Modi on 10/12/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//
//

import Foundation
import CoreData


extension WeatherItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherItem> {
        return NSFetchRequest<WeatherItem>(entityName: "WeatherItem")
    }

    @NSManaged public var country: String?
    @NSManaged public var sunrise: Int64
    @NSManaged public var sunset: Int64
    @NSManaged public var main: String?
    @NSManaged public var desc: String?
    @NSManaged public var temp: Float
    @NSManaged public var humidity: Int32
    @NSManaged public var pressure: Int64
    @NSManaged public var tempMin: Float
    @NSManaged public var tempMax: Float
    @NSManaged public var wind: Float
    @NSManaged public var deg: Float
    @NSManaged public var rain: Int16
    @NSManaged public var clouds: Int16
    @NSManaged public var name: String?
    @NSManaged public var date: Int64

}
