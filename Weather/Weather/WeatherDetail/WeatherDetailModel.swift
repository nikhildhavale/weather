//
//  WeatherDetailModel.swift
//  Weather
//
//  Created by Nikhil Modi on 10/14/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import Foundation
class WeatherDetailModel {
    static let sectionTitles = ["Location and Time","Temperature","Sun","Humidity","Pressure","Wind","Rains"]
    var weatherDetailStructure = [String:Any]()
    init(weatherItem:WeatherItem) {
        if let name = weatherItem.name {
            weatherDetailStructure["Location and Time"] = [(title:"Location",value:name),(title:"Date",value:weatherItem.date)]
        }
        weatherDetailStructure["Temperature"] = [(title:"Temperature",value:weatherItem.temp),(title:"Minimum Temperature",value:weatherItem.tempMin),(title:"Maximum Temperature",value:weatherItem.tempMax)]
        weatherDetailStructure["Sun"] = [(title:"Sunrise",value:weatherItem.sunrise),(title:"Sunset",value:weatherItem.sunset)]
        weatherDetailStructure["Humidity"] = [(title:"Humidity",value:weatherItem.humidity)]
        weatherDetailStructure["Pressure"] = [(title:"Pressure",value:weatherItem.pressure)]
        weatherDetailStructure["Wind"] = [(title:"Degree",value:weatherItem.deg),(title:"Speed",value:weatherItem.wind)]
        weatherDetailStructure["Rains"] = [(title:"Rain",value:weatherItem.rain)]
    }
    func noOfRow(section:Int) -> Int{
        if let array = weatherDetailStructure[WeatherDetailModel.sectionTitles[section]] as? [Any]{
         return   array.count
        }
        return 0
    }
    func getCellInfoAtIndex(indexPath:IndexPath) ->(cellType:String,title:String,info:Any?)? {
        var info :(cellType:String,title:String,info:Any?)?
        if let rowArray = weatherDetailStructure[WeatherDetailModel.sectionTitles[indexPath.section]] as? [(title:String,value:Any)]{
            
            info =  (AppConstants.weatherItemIdentifier,rowArray[indexPath.row].title,rowArray[indexPath.row].value)
        }
        if let section = Section(rawValue: indexPath.section){
            switch section {
            case .main, .temp,.sun,.wind:break
            case .humidity,.pressure,.rains:
                info?.cellType = AppConstants.weatherDetailIdentifier
                
            }
        }

        


        return info
    }
}
