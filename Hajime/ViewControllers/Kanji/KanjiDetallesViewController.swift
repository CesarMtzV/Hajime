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
    
    var kanjiSeleccionado : KanjiUsuario!

    override func viewDidLoad() {
        super.viewDidLoad()

        lbCaracter.text = kanjiSeleccionado.caracter
        lbLecturas.text = kanjiSeleccionado.pronunciacion
        lbSignificado.text = kanjiSeleccionado.significado
        lbEjemplos.text = kanjiSeleccionado.ejemplo
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
