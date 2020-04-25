//
//  WeatherCell.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 10/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var cityName:UILabel!
    @IBOutlet weak var temperature:UILabel!
    
    
    func configure(_ vm: WeatherViewModel){
        self.cityName.text = vm.name.value
        self.temperature.text = "\(vm.currentTemperature.temperature.value.formatAsDeg)"
    }
}
