//
//  KatakanaViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 15/04/21.
//

import UIKit

class KatakanaViewController: UIViewController {
    
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
        title = "Katakana"
    }
    override var shouldAutorotate: Bool{
        return false
    }
}
