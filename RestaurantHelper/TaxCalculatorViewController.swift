//
//  TaxCalculatorViewController.swift
//  RestaurantHelper
//
//  Created by Erica Correa on 5/10/16.
//  Copyright © 2016 Turn to Tech. All rights reserved.
//

import UIKit

class TaxCalculatorViewController: UIViewController {
    
    @IBOutlet weak var billInputField: UITextField!
    @IBOutlet weak var taxInputSlider: UISlider!
    @IBOutlet weak var taxAmountLabel: UILabel!
    @IBOutlet weak var totalWithTaxLabel: UILabel!
    
    @IBAction func updateTax(sender: AnyObject) {
        
        guard let taxPercentage:Float = self.taxInputSlider.value
            else { return }
        
        self.taxAmountLabel.text = String(format: "%.3f%%",taxPercentage)
        
        guard let billAmount:Double = Double(self.billInputField.text!)
            else { return }
        
        self.totalWithTaxLabel.text = String(format: "$%.2f", Double(1 + taxPercentage / 100) * billAmount )
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}