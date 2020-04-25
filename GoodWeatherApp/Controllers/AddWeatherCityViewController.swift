//
//  AddWeatherCityViewController.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 10/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    
    func AddWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField:BindingTextField!{
        didSet{
            cityNameTextField.Binding(callback:{ self.addCityViewModel.city = $0})
        }
    }
    @IBOutlet weak var zipCode:BindingTextField!{
        didSet{
            zipCode.Binding(callback:{ self.addCityViewModel.zipCode = $0})
        }
    }
    @IBOutlet weak var nameOfState:BindingTextField!{
        didSet{
            nameOfState.Binding(callback:{ self.addCityViewModel.state = $0})
        }
    }

    override func viewDidLoad(){
        super.viewDidLoad()
    }
    var addweatherDelegate:AddWeatherDelegate?
    
    
    @IBAction func saveCityPressed(){
        
        print(self.addCityViewModel)
        
        if let cityName = cityNameTextField.text {
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=64ac03ccd32ad98626331333f7636202&units=metric")!
            
            
            let resource = Resource<WeatherViewModel>(url:url){data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                    return weatherVM
            }
            
            WebService().load(resource: resource){ [weak self]
                result in
                
                if let weatherVM = result {
                    if let delegate = self?.addweatherDelegate{
                        delegate.AddWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }

            
        }
        
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
}
