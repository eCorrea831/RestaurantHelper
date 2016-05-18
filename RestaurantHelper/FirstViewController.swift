//
//  FirstViewController.swift
//  RestaurantHelper
//
//  Created by Erica Correa on 5/10/16.
//  Copyright © 2016 Turn to Tech. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var percentTipSlider: UISlider!
    @IBOutlet weak var percentTipLabel: UILabel!
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var roundSwitch: UISwitch!
    
    @IBAction func updateTipAmount(sender: AnyObject) {
        
        guard let tipPercentageAmount:Int = Int(ceil(self.percentTipSlider.value))
            else { return }
        self.percentTipLabel.text = "\(tipPercentageAmount)%"
        
        guard let billAmount:Double = Double(self.billTotalTextField.text!)
            else { return }
        var tipAmount:Double = billAmount * Double(tipPercentageAmount) / 100
        
        if self.roundSwitch.on {
            tipAmount = ceil(tipAmount)
        }
        
        self.tipTotalLabel.text = String(format: "$%.2f", tipAmount)
        
        var comment:String = ""
        
        switch tipPercentageAmount {
        case 0...5:
            comment = "Cheapskate"
        case 6...14:
            comment = "Wow, service must've sucked"
        case 15:
            comment = "Ok, Average service"
        case 16...19:
            comment = "Good service"
        case 20...24:
            comment = "Great service!"
        case 25...35:
            comment = "Hey, big spender!"
        default:
            comment = "Hmmm?!"
        }
        self.commentLabel.text = comment
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}

