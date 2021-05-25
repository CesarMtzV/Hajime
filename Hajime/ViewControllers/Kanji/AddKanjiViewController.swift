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
    
    var delegadoKanji : protocoloAgregarkanji!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func guardarKanji(_ sender: UIButton) {
        delegadoKanji.agregarKanji(kanji: KanjiUsuario(caracter: tfKanji.text!, pronunciacion: tfLecturas.text!, significado: tfSignificados.text!, ejemplo: tfEjemplos.text!))
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
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
