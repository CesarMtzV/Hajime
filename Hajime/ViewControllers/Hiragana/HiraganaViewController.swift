//
//  HiraganaViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 15/04/21.
//

import UIKit

class HiraganaViewController: UIViewController {
    
    
    @IBOutlet weak var btnEstudiar: UIButton!
    @IBOutlet weak var btnPracticar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarBotones()
        configurarNavbar()
    }
    
    func configurarBotones(){
        btnEstudiar.layer.cornerRadius = 0.5 * btnEstudiar.bounds.size.width
        btnEstudiar.clipsToBounds = true
        
        btnPracticar.layer.cornerRadius = 0.5 * btnPracticar.bounds.size.width
        btnPracticar.clipsToBounds = true
    }
    
    func configurarNavbar(){
        
        //let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: nil)
        
        title = "Hiragana"
        //navigationItem.setRightBarButton(settingsButton, animated: true)
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
