//
//  DatabaseModel.swift
//  Weather
//
//  Created by Nikhil Modi on 10/14/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class DatabaseModel {
    static let shared = DatabaseModel()
    var context:NSManagedObjectContext!
    private init() {
      let appDelegate =   UIApplication.shared.delegate as! AppDelegate
      context = appDelegate.persistentContainer.viewContext
    }
    func getWeatherInfo(with Id:Int) -> WeatherItem?{
        let fetch = NSFetchRequest<WeatherItem>(entityName: AppConstants.weatherItem)
        fetch.predicate = NSPredicate(format: "idcity == %@", Id)
        do {
           let weatherItemArray =  try fetch.execute()
            return weatherItemArray.first
        } catch  {
            return nil

        }
        
    }
    
}
