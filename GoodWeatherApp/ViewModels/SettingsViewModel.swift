//
//  SettingsViewModel.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 11/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation

enum Unit:String,CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit{
    var displayName : String {
        get {
            switch(self) {
            case .celcius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    let unit = Unit.allCases
    private var _selectUnit = Unit.fahrenheit
    
    var selectedUnit : Unit{
        get{
            let userDeflt = UserDefaults.standard
            if let valueRet = userDeflt.value(forKey: "unit") as? String{
                return Unit(rawValue: valueRet)!
            }
            
            return _selectUnit
        }
        
        set {
            let userDeflt = UserDefaults.standard
            userDeflt.set(newValue.rawValue, forKey: "unit")
        }
    }
}
