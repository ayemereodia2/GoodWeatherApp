//
//  AppDelegate.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 10/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = UIColor.init(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        UIBarButtonItem.appearance().tintColor = .gray
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.groupTableViewBackground]
        
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        setupDefaultSetting()
        return true
    }

    
    private func setupDefaultSetting(){
        let userDefault = UserDefaults.standard
        if let res = userDefault.value(forKey: "unit") as? String{
            userDefault.set(res, forKey: "unit")

            
        }else{
                userDefault.set(Unit.celcius.rawValue, forKey: "unit")
        }
        
       
    }
}

