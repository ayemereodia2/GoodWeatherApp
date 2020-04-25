//
//  ViewController.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 10/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController,AddWeatherDelegate,SettingsDelegate {
    
    private var weatherDataSource:TableViewDataSource<WeatherCell,WeatherViewModel>!
    
    
    
    func settingsDone(vm: SettingsViewModel) {
        self.weatherList.updateUnit(to:vm.selectedUnit)
        tableView.reloadData()
    }
    
    
    private var weatherList:WeatherListViewModel = WeatherListViewModel()
    
    func AddWeatherDidSave(vm: WeatherViewModel) {
        self.weatherList.addWeatherViewModel(vm)
        self.weatherDataSource.updateItem(self.weatherList.weatherListViewModel)
        self.tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherDataSource = TableViewDataSource(cellIdentifier: "WeatherCell", items: self.weatherList.weatherListViewModel){ cell, vm in
            cell.configure(vm)
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.dataSource = self.weatherDataSource
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController"{
            prepareSegueForAddWeather(segue: segue)
        }else if segue.identifier == "SettingsViewController"{
            prepareSegueForSettings(segue: segue)
        }
        else if segue.identifier == "WeatherDetailsViewController"{
            prepareSegueForWeatherDetails(segue: segue)
        }
      
    }
    
    
    private func prepareSegueForWeatherDetails(segue:UIStoryboardSegue){
        guard  let destination = segue.destination as? UINavigationController else {
            fatalError("Controller not found!")
        }
        
        guard let weatherDetails = destination.viewControllers.first as? WeatherDetailsViewController else{
            fatalError("Child controller not found")
        }
        if let rowId = self.tableView.indexPathForSelectedRow?.row{
            weatherDetails.vm = self.weatherList.getModel(at: rowId)
        }
        
        
        }
    

    
   private func prepareSegueForAddWeather(segue:UIStoryboardSegue){
        
    guard  let destination = segue.destination as? UINavigationController else {
        fatalError("Controller not found!")
    }
    
    guard let addWeatherController = destination.viewControllers.first as? AddWeatherCityViewController else{
        fatalError("Child controller not found")
    }
    
    addWeatherController.addweatherDelegate = self
    
    }
    

    private func prepareSegueForSettings(segue:UIStoryboardSegue){
        
        guard  let destination = segue.destination as? UINavigationController else {
            fatalError("Controller not found!")
        }
        
        guard let settingsController = destination.viewControllers.first as? SettingsViewController else{
            fatalError("Child controller not found")
        }
        
        settingsController.delegate = self
        }
    }


