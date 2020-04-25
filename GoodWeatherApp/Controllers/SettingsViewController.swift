//
//  SettingsViewController.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 11/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation

import UIKit

protocol SettingsDelegate {
    func settingsDone(vm:SettingsViewModel)
}

class SettingsViewController: UITableViewController {
    
    private var settingsVM = SettingsViewModel()
    var delegate:SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    @IBAction func settingsDone(){
        if let delegate = self.delegate {
            delegate.settingsDone(vm: self.settingsVM)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsVM.unit.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        //let settings 
        
        cell.textLabel?.text = self.settingsVM.unit[indexPath.row].displayName
        
        if self.settingsVM.unit[indexPath.row] == self.settingsVM.selectedUnit{
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.visibleCells.forEach{
            cells in
            cells.accessoryType = .none
        }
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingsVM.selectedUnit = unit
        }
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    //c hange value after few seconds
    
    
}
