//
//  BindingTextField.swift
//  GoodWeatherApp
//
//  Created by Ayemere  Odia  on 12/04/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

class BindingTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    var textChange:(String)->() = {
        _ in
    }
    
    func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ uitextField:UITextField){
        
        if let text = uitextField.text {
            self.textChange(text)
        }
    }
    
    func Binding(callback:@escaping (String)->()){
        self.textChange = callback
    }
}
