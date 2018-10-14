//
//  Extension.swift
//  Weather
//
//  Created by Nikhil Modi on 10/14/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func showAlertOK(title:String,message:String){
        print("show alert \(message)")
        showAlertOk(title: title, message: message,alertAction:nil)
    }
    func showAlertOk(title:String,message:String,alertAction:UIAlertAction?){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if alertAction == nil {
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //           }
            
        }
        else{
            alertController.addAction(alertAction!)
            
        }
        
        if UIApplication.shared.frontmostViewController?.presentedViewController == nil {
            UIApplication.shared.frontmostViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
extension UIApplication {
    
    var frontmostViewController: UIViewController? {
        let window = UIApplication.shared.keyWindow
        var viewController = window!.rootViewController
        while viewController?.presentedViewController != nil {
            viewController = viewController?.presentedViewController
        }
        
        return viewController
    }
}
