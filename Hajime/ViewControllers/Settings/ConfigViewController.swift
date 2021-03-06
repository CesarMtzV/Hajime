//
//  ConfigViewController.swift
//  Hajime
//
//  Created by user189353 on 4/19/21.
//

import UIKit

class ConfigViewController: UIViewController {
    @IBOutlet weak var switchNotifications: UISwitch!
    @IBOutlet weak var textfieldHours: UITextField!
    @IBOutlet weak var textfieldMinutes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        updateConfigValues()
        // Do any additional setup after loading the view.
    }
    
    func updateConfigValues() {
        let defaults = UserDefaults.standard
        switchNotifications.isOn = defaults.bool(forKey: "notifSwitch")
        
        if let hours = defaults.value(forKey: "tfHours") as? String{
            textfieldHours.text = hours
        }
        
        if let min = defaults.value(forKey: "tfMinutes") as? String {
            textfieldMinutes.text = min
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveConfigValues()
    }

    override func viewWillDisappear(_ animated: Bool) {
        saveConfigValues()
//        let tabVC = self.presentingViewController as! UITabBarController
//        let initialView = tabVC.selectedViewController as! ViewController
//        initialView.getConfigValues()
    }
    
    @IBAction func saveConfigValues() {
        let defaults = UserDefaults.standard
    
        defaults.set(switchNotifications.isOn, forKey: "notifSwitch")
        defaults.setValue(textfieldHours.text, forKey: "tfHours")
        defaults.setValue(textfieldMinutes.text, forKey: "tfMinutes")
        
        if switchNotifications.isOn{
            guardarDatos()
        }
    }
    
    @IBAction func removeKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func guardarDatos() {
        let defaults = UserDefaults.standard
        
        defaults.setValue(true, forKey: "NewAlerts")
    }
    
    override var shouldAutorotate: Bool{
        return false
    }
}
