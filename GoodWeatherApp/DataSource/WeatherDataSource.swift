//
//  WeatherDataSource.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 13/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource : NSObject,UITableViewDataSource {
    
    let cellIdentifier:String = "WeatherCell"
    
    private var weatherListVM:WeatherListViewModel
    
    init( weatherListVM:WeatherListViewModel) {
        
        //self.cellIdentifier = cellIdentifier
        self.weatherListVM = weatherListVM
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListVM.weatherListViewModel.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("cell not found")
        }
        let vm = self.weatherListVM.getModel(at: indexPath.row)
        cell.configure(vm)
        return cell
    }
    
    
}
