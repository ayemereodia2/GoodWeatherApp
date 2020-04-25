//
//  WeatherListViewModel.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 10/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation

class WeatherListViewModel {
    
    private(set) var weatherListViewModel = [WeatherViewModel]()
    
     func addWeatherViewModel(_ vm:WeatherViewModel){
        self.weatherListViewModel.append(vm)
    }
    
     func updateUnit(to: Unit){
        
        switch to {
        case .celcius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
     func toCelcius(){
        self.weatherListViewModel =  self.weatherListViewModel.map {
            vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value - 32) * 5/9
            
            return weatherModel
        }
     }
    
     func toFahrenheit(){
        
        self.weatherListViewModel =  self.weatherListViewModel.map {
            vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value * 9/5) + 32
            
            return weatherModel
        }
     }
    
    func numberOfRows(section:Int)->Int{
        return self.weatherListViewModel.count
    }
    
    func getModel(at indexPath:Int)->WeatherViewModel{
        return self.weatherListViewModel[indexPath]
    }
}


// MARK: - Type Eraser

class Dynamic<T>: Decodable where T: Decodable {
    
    typealias Listener = (T)->()
    
    var listener:Listener?
    
    var value : T {
        didSet {
            listener?(value)
        }
    }
    
    
    
    init(_ value:T){
        self.value = value
    }
    
    func bindTo(listener: @escaping Listener){
        self.listener = listener
        self.listener?(self.value)
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
}


struct WeatherViewModel:Decodable {
    var currentTemperature:TemperatureViewModel
    let name:Dynamic<String>
    
    private enum CodingKeys:String,Decodable,CodingKey{
        case currentTemperature = "main"
        case name 
    }
    
     init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy:CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }
}

struct TemperatureViewModel: Decodable {
    var temperature:Dynamic<Double>
    var temperatureMin:Dynamic<Double>
    var temperatureMax:Dynamic<Double>
    
    
    private enum CodingKeys:String,Decodable,CodingKey{
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy:CodingKeys.self)
        temperature = Dynamic(try container.decode(Double.self, forKey: .temperature))
         temperatureMin = Dynamic(try container.decode(Double.self, forKey: .temperatureMin))
         temperatureMax = Dynamic(try container.decode(Double.self, forKey: .temperatureMax))
    }
}
