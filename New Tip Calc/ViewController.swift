//
//  ViewController.swift
//  New Tip Calc
//
//  Created by Yashvardhan Khaitan on 1/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = UserDefaults.standard
        
        let intValue = defaults.integer(forKey: "myInt")
        
        if (intValue == 1) {
            overrideUserInterfaceStyle = .dark
        } else if (intValue == 0) {
            overrideUserInterfaceStyle = .light
        }
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(inputField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.2, 0.25]
        
        let tip = bill * tipPercentages[tipAmount.selectedSegmentIndex]
        let total = bill + tip
        
        totalLabel.text = String(format:"$%.2f", total)
        tipLabel.text = String(format:"$%.2f", tip)
    }
}

