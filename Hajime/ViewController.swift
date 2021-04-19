//
//  ViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 27/03/21.
//

import UIKit

var notifOn: Bool = false
var darkModeOn: Bool = false
var reminderHour: Int = 0
var reminderMin: Int = 0

class ViewController: UIViewController {
    @IBOutlet weak var btShowMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getConfigValues()
        // Do any additional setup after loading the view.
    }

    func getConfigValues() {
        let defaults = UserDefaults.standard
        notifOn = defaults.bool(forKey: "notifSwitch")
        darkModeOn = defaults.bool(forKey: "reminderSwitch")
        reminderHour = defaults.integer(forKey: "tfHours")
        reminderMin = defaults.integer(forKey: "tfMinutes")
    }
}

