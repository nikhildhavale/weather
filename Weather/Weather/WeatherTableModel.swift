
//
//  WeatherTableModel.swift
//  Weather
//
//  Created by Nikhil Modi on 10/12/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import Foundation
import CoreData
protocol WeatherUIDelegate:class  {
    func success()
    func UIChange()
    func failure(error:Error)
 }
class WeatherTableModel {
    var resultViewController:NSFetchedResultsController<WeatherItem>
    var networkSession:NetworkSession?
    weak var delegate:(WeatherUIDelegate & NSFetchedResultsControllerDelegate)?

    init(delegate:(WeatherUIDelegate & NSFetchedResultsControllerDelegate)) {
      self.delegate = delegate
        
        resultViewController = DatabaseModel.shared.getFetchRequestController()
        resultViewController.delegate = delegate

    }
    func initialise(){
        networkSession = NetworkSession(success: { (data,requestString,url) in
                let jsonDecoder = JSONDecoder()
            do {
                let weatherResponse = try jsonDecoder.decode(WeatherResponse.self, from: data)
                if let id = weatherResponse.id {
                    if let weatherItem =   DatabaseModel.shared.getWeatherInfo(with: Int64(id)) {
                        if weatherItem.temp != weatherResponse.main?.temp || weatherItem.tempMax != weatherResponse.main?.temp_max || weatherItem.tempMin != weatherResponse.main?.temp_min
                        {
                            DatabaseModel.shared.updateWeatherItem(weatherItem: weatherItem, weatherResponse: weatherResponse)
                        }
                    }
                    else {
                        DatabaseModel.shared.insertWeatherItem(weatherResponse: weatherResponse)
                    }
                }
                
                self.delegate?.success()

            }
            catch{
                print(error)
            }
            
        }, andFailure: { (error,requestString,url) in
            self.delegate?.failure(error: error)
            
        }, andCommonUI:{
            DispatchQueue.main.async {
                self.delegate?.UIChange()

            }
            
        })
        do {
           try resultViewController.performFetch()
            
        }
        catch{
            
        }

    }
    func requestDataFromServer(){
        for cityId in Location.locationId {
            let cityIdString = "\(cityId)"
            let urlString = AppConstants.urlString.replacingOccurrences(of: AppConstants.locationId, with: cityIdString)
            networkSession?.setUpGetRequest(urlString: urlString)
        }
    }
}
