//
//  Double+Extensions.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 11/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDeg:String {
        
        return String(format:"%0.f°",self)
    }
}
