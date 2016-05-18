//
//  SecondViewController.swift
//  RestaurantHelper
//
//  Created by Erica Correa on 5/10/16.
//  Copyright © 2016 Turn to Tech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var numberOfPeople: UISegmentedControl!
    @IBOutlet weak var billSplit: UILabel!
    
    @IBAction func updateBillSplit(sender: AnyObject) {
        
        guard let billAmount:Double = Double(self.billTotal.text!)
            else { return }
        
        let number:Int = self.numberOfPeople.selectedSegmentIndex
        
        let billSplitAmount = billAmount / Double(number + 2)
        
        self.billSplit.text = String(format: "$%.2f", billSplitAmount)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}