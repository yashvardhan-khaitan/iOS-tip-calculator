//
//  SettingsViewController.swift
//  New Tip Calc
//
//  Created by Yashvardhan Khaitan on 1/14/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var themeOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = UserDefaults.standard
        
        let intValue = defaults.integer(forKey: "myInt")
        
        if (intValue == 1) {
            overrideUserInterfaceStyle = .dark
            themeOutlet.selectedSegmentIndex = 1
        } else if (intValue == 0) {
            overrideUserInterfaceStyle = .light
            themeOutlet.selectedSegmentIndex = 0
        }
    }

    @IBAction func toggleTheme(_ sender: Any) {
        let darkLight = [0, 1]
        let defaults = UserDefaults.standard

        if (darkLight[themeOutlet.selectedSegmentIndex] == 0) {
            overrideUserInterfaceStyle = .light
            defaults.set(0, forKey: "myInt")
        } else if (darkLight[themeOutlet.selectedSegmentIndex] == 1) {
            overrideUserInterfaceStyle = .dark
            defaults.set(1, forKey: "myInt")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
