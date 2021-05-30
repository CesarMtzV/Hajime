//
//  KanjiDetallesViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 23/05/21.
//

import UIKit

class KanjiDetallesViewController: UIViewController {
    
    @IBOutlet weak var lbCaracter: UILabel!
    @IBOutlet weak var lbLecturas: UILabel!
    @IBOutlet weak var lbSignificado: UILabel!
    @IBOutlet weak var lbEjemplos: UILabel!
    @IBOutlet weak var lbIndicadorLecturas: UILabel!
    @IBOutlet weak var lbIndicadorSignificados: UILabel!
    @IBOutlet weak var lbIndicadorEjemplos: UILabel!
    
    
    var kanjiSeleccionado : KanjiUsuario!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Kanji Details"

        lbCaracter.text = kanjiSeleccionado.caracter
        lbLecturas.text = kanjiSeleccionado.pronunciacion
        lbSignificado.text = kanjiSeleccionado.significado
        lbEjemplos.text = kanjiSeleccionado.ejemplo
        
        //Hacer las esquinas redondas
        
        lbCaracter.layer.cornerRadius = 5
        lbCaracter.clipsToBounds = true
        
        lbIndicadorLecturas.layer.cornerRadius = 8
        lbIndicadorLecturas.clipsToBounds = true
        
        lbIndicadorSignificados.layer.cornerRadius = 8
        lbIndicadorSignificados.clipsToBounds = true
        
        lbIndicadorEjemplos.layer.cornerRadius = 8
        lbIndicadorEjemplos.clipsToBounds = true
        
    }
    
    override var shouldAutorotate: Bool{
        return false
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
