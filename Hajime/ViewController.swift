//
//  ViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 27/03/21.
//

import UIKit
import UserNotifications

var notifOn: Bool = false
var darkModeOn: Bool = false
var reminderHour: Int = 0
var reminderMin: Int = 0

class ViewController: UIViewController {
    @IBOutlet weak var btShowMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound])
        { granted, error in
        }
        
        let content = UNMutableNotificationContent()
        content.title = "¡Es hora de estudiar!"
        content.body = "La práctica hace al maestro"
        
        var dateComponents = DateComponents()
        dateComponents.hour = 11
        dateComponents.minute = 9

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request)
        { (error) in
        }
        
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

