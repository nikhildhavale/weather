//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by Nikhil Modi on 10/12/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import UIKit
import CoreData
class WeatherTableViewController: UITableViewController,WeatherUIDelegate,NSFetchedResultsControllerDelegate{
    var weatherTableModel:WeatherTableModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView .register(UINib(nibName: "TemperatureTableViewCell", bundle: nil), forCellReuseIdentifier: AppConstants.weatherItemIdentifier)
        self.tableView.tableFooterView = UIView()
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        weatherTableModel = WeatherTableModel(delegate: self)
        weatherTableModel?.initialise()
        weatherTableModel?.requestDataFromServer()
        
    }
    @objc func refreshData(){
        weatherTableModel?.requestDataFromServer()

    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?){
        guard let indexPathNonNil = newIndexPath else {
            return
        }

        switch type {

        case .insert:
                tableView.insertRows(at: [indexPathNonNil], with: UITableView.RowAnimation.automatic)
        case .delete:
                tableView.deleteRows(at: [indexPathNonNil], with: UITableView.RowAnimation.automatic)
        case .move:break
            
        case .update:
            tableView.reloadRows(at: [indexPathNonNil], with: UITableView.RowAnimation.automatic)
            
        }
    }
    func success() {
        
    }
    
    func UIChange() {
        
        if let parent = self.parent as? WeatherContainerViewController {
            parent.activityIndicatorView.isHidden = true
        }
        self.tableView.refreshControl?.endRefreshing()
    }
    
    func failure(error:Error) {
        self.showAlertOK(title: "Error", message: error.localizedDescription)
    }
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherTableModel?.resultViewController.sections?[section].numberOfObjects ?? 0
    }

    /**/
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.weatherItemIdentifier, for: indexPath)
        as! TemperatureTableViewCell
        if let weatherItem = weatherTableModel?.resultViewController.object(at: indexPath) {
            cell.temperatureLabel.text = "\(weatherItem.temp)"
            cell.placeLabel.text = weatherItem.name
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            self.parent?.performSegue(withIdentifier: AppConstants.showDetails, sender: weatherTableModel?.resultViewController.object(at: indexPath))

        
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
