//
//  WeatherDetailTableViewController.swift
//  Weather
//
//  Created by Nikhil Modi on 10/14/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import UIKit

class WeatherDetailTableViewController: UITableViewController {
    var weatherItem:WeatherItem?
    var weatherDetailModel:WeatherDetailModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView .register(UINib(nibName: "TemperatureTableViewCell", bundle: nil), forCellReuseIdentifier: AppConstants.weatherItemIdentifier)
      //  self.tableView .register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: AppConstants.weatherDetailIdentifier)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: AppConstants.weatherDetailIdentifier)
        if let weatherItemNonNil = weatherItem {
            weatherDetailModel = WeatherDetailModel(weatherItem: weatherItemNonNil)

        }
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
   override func numberOfSections(in tableView: UITableView) -> Int {
       return WeatherDetailModel.sectionTitles.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherDetailModel?.noOfRow(section: section) ?? 0 
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return WeatherDetailModel.sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if   let info =  weatherDetailModel?.getCellInfoAtIndex(indexPath: indexPath){
            if let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.weatherItemIdentifier, for: indexPath) as? TemperatureTableViewCell {
                if info.cellType == AppConstants.weatherItemIdentifier {
                    cell.placeLabel.text = "\(info.title)"
                    cell.temperatureLabel.text = "\(info.info ?? "")"
                }
                else {
                    cell.placeLabel.text = "\(info.info ?? "")"
                    cell.temperatureLabel.text = nil
                }
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: info.cellType, for: indexPath)
                cell.textLabel?.text = "\(info.info ?? "")"
                cell.textLabel?.textColor = UIColor.black
                print("\(info.info ?? "")")
            }
            
            

    }
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.weatherDetailIdentifier, for: indexPath)
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
