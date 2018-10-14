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
    func getWeatherInfo(with Id:Int64) -> WeatherItem?{
        let fetch = NSFetchRequest<WeatherItem>(entityName: AppConstants.weatherItem)
        fetch.predicate = NSPredicate(format: "idcity == %lld", Id)
        do {
           let weatherItemArray =  try context.fetch(fetch)
            return weatherItemArray.first
        } catch  {
            print(error)
            return nil

        }
        
    }
    func getFetchRequestController() -> NSFetchedResultsController<WeatherItem>{
        let fetchRequest = NSFetchRequest<WeatherItem>()
        let entityDescription = NSEntityDescription.entity(forEntityName: AppConstants.weatherItem, in: context)
        fetchRequest.entity = entityDescription
    
        
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(WeatherItem.idcity), ascending: true)]
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil)
    }
    func insertWeatherItem(weatherResponse:WeatherResponse)  {
        
            let weatherItem = NSEntityDescription.insertNewObject(forEntityName: AppConstants.weatherItem, into: context) as! WeatherItem
            updateWeatherItem(weatherItem: weatherItem, weatherResponse: weatherResponse)

    }
    func updateWeatherItem(weatherItem:WeatherItem,weatherResponse:WeatherResponse){
        do {
            weatherItem.idcity = weatherResponse.id ?? 0
            weatherItem.tempMin = weatherResponse.main?.temp_min ?? 0
            weatherItem.tempMax = weatherResponse.main?.temp_max ?? 0
            weatherItem.temp = weatherResponse.main?.temp ?? 0
            weatherItem.sunset = weatherResponse.sys?.sunset ?? 0
            weatherItem.sunrise = weatherResponse.sys?.sunrise ?? 0
            weatherItem.country = weatherResponse.sys?.country
            weatherItem.date = weatherResponse.dt ?? 0
            weatherItem.humidity = Int32(weatherResponse.main?.humidity ?? 0)
            weatherItem.pressure = Int64(weatherResponse.main?.pressure ?? 0)
            weatherItem.wind = weatherResponse.wind?.speed ?? 0
            weatherItem.rain = Int16(weatherResponse.rain?.h ?? 0)
            weatherItem.clouds = Int16(weatherResponse.clouds?.all ?? 0)
            weatherItem.name = weatherResponse.name
            try context.save()
        }
        catch{
            
        }

    }
}
