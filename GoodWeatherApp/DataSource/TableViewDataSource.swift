//
//  TableViewDataSource.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 13/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType,ViewModel> :NSObject, UITableViewDataSource where CellType :UITableViewCell {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else{
            fatalError("cell not found")
        }
        let vm = self.items[indexPath.row]
        
        self.configureCell(cell,vm)
        
        return cell
    }
    
    
    let cellIdentifier:String
    var items:[ViewModel]
    
    let configureCell: (CellType, ViewModel) -> ()
    
    init(cellIdentifier:String, items:[ViewModel], configure:@escaping (CellType, ViewModel) -> ()){
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configure
    }
    
    func updateItem(_ items:[ViewModel]){
        self.items = items
    }
    
}
