//
//  AddKanjiViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 23/05/21.
//

import UIKit

protocol protocoloAgregarkanji {
    func agregarKanji(kanji: KanjiUsuario)
}

class AddKanjiViewController: UIViewController {
    
    @IBOutlet weak var tfKanji: UITextField!
    @IBOutlet weak var tfLecturas: UITextField!
    @IBOutlet weak var tfSignificados: UITextField!
    @IBOutlet weak var tfEjemplos: UITextField!
    @IBOutlet weak var viewKanji: UIView!
    @IBOutlet weak var viewLecturas: UIView!
    @IBOutlet weak var viewSignificados: UIView!
    @IBOutlet weak var viewEjemplos: UIView!
    @IBOutlet weak var btnGuardar: UIButton!
    
    
    var delegadoKanji : protocoloAgregarkanji!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add kanji"
        
        viewKanji.layer.cornerRadius = 5
        viewKanji.clipsToBounds = true
        
        viewLecturas.layer.cornerRadius = 5
        viewLecturas.clipsToBounds = true
        
        viewSignificados.layer.cornerRadius = 5
        viewSignificados.clipsToBounds = true
        
        viewEjemplos.layer.cornerRadius = 5
        viewEjemplos.clipsToBounds = true
        
        btnGuardar.layer.cornerRadius = 5
        btnGuardar.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    @IBAction func guardarKanji(_ sender: UIButton) {
        delegadoKanji.agregarKanji(kanji: KanjiUsuario(caracter: tfKanji.text!, pronunciacion: tfLecturas.text!, significado: tfSignificados.text!, ejemplo: tfEjemplos.text!))
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        guardarDatos()
    }
    
    func guardarDatos() {
        let defaults = UserDefaults.standard
        
        defaults.setValue(true, forKey: "Kanji")
    }
    
    @IBAction func removeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    override var shouldAutorotate: Bool{
        return false
    }
}
