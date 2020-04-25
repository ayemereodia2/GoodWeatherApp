//
//  AddCityViewModel.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 12/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation


struct AddCityViewModel {
    
    var city: String = ""
    var state: String = ""
    var zipCode:String = ""
    
    private  func latestValue(){
        print("new city value: \(city)")
        print("new state value: \(state)")
        print("new zipCode value: \(zipCode)")
    }
     init()
    {
        latestValue()
    }
}
