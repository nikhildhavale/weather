//
//  WeatherContainerViewController.swift
//  Weather
//
//  Created by Nikhil Modi on 10/12/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import UIKit

class WeatherContainerViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let activityIndicatorViewController = segue.destination as? ActivityIndicatorViewController{
            activityIndicatorViewController.customTextString = AppConstants.loadingData
        }
    }
 

}
