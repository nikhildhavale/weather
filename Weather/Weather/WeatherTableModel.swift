
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
    var resultViewController:NSFetchedResultsController<NSFetchRequestResult>?
    var networkSession:NetworkSession?
    weak var delegate:(WeatherUIDelegate & NSFetchedResultsControllerDelegate)?

    init(delegate:(WeatherUIDelegate & NSFetchedResultsControllerDelegate)) {
      self.delegate = delegate


    }
    func initialise(){
        networkSession = NetworkSession(success: { (data,requestString,url) in
            self.delegate?.success()
            
        }, andFailure: { (error,requestString,url) in
            self.delegate?.failure(error: error)
            
        }, andCommonUI:{
            self.delegate?.UIChange()
            
        })
    }
    func requestDataFromServer(){
        for cityId in Location.locationId {
            let cityIdString = "\(cityId)"
            let urlString = AppConstants.urlString.replacingOccurrences(of: AppConstants.locationId, with: cityIdString)
            networkSession?.setUpGetRequest(urlString: urlString)
        }
    }
}
