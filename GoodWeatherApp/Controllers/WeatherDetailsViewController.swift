//
//  WeatherDetailsViewController.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 12/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation
import UIKit



class WeatherDetailsViewController : UIViewController {
    
    @IBOutlet weak var cityName:UILabel!
    @IBOutlet weak var max_Temp:UILabel!
    @IBOutlet weak var min_Temp:UILabel!
    
    var vm: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let vm = vm {
//            cityName.text = vm.name.value
//            max_Temp.text = "\(vm.currentTemperature.temperatureMax.value.formatAsDeg) °"
//            min_Temp.text = "\(vm.currentTemperature.temperatureMin.value.formatAsDeg)"
//        }
        
        setUpViewBinds()
    }
    
    
    func setUpViewBinds(){
        
        
        if let vm = self.vm {
            vm.name.bindTo(listener: {self.cityName.text = $0})
            vm.currentTemperature.temperatureMax.bindTo(listener: {self.max_Temp.text = $0.formatAsDeg})
            vm.currentTemperature.temperatureMin.bindTo(listener: {self.min_Temp.text = $0.formatAsDeg})
            

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            
            self.vm?.name.value = "Dallas"
        }

    }
}
