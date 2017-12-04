//
//  ViewController.swift
//  Quick Tip
//
//  Created by Joseph Davey on 11/28/17.
//  Copyright © 2017 Joseph Davey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        let percentage = defaults.float(forKey: "percent")
        let tip = defaults.float(forKey: "tip")
        let bill = defaults.float(forKey: "bill")
        let total = defaults.float(forKey: "total")
        
        tipSlider.value = percentage
        percentLabel.text = String(format: "%.0f%%", percentage)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        billField.text = String(format: "%.2f", bill)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let percentage = roundf(tipSlider.value)
        let bill : Double = Double(billField.text!) ?? 0
        let tip = bill * Double(percentage / 100)
        let total = bill + tip
        
        percentLabel.text = String(format: "%.0f%%", percentage)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        defaults.set(bill, forKey: "bill")
        defaults.set(tip, forKey: "tip")
        defaults.set(total, forKey: "total")
        defaults.set(percentage, forKey: "percent")
        defaults.synchronize()
    }
}

