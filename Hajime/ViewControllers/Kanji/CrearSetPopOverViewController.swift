//
//  CrearSetPopOverViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 15/05/21.
//

import UIKit

protocol protocoloAgregarSet {
    func agregarSet(set: KanjiSet)
}

class CrearSetPopOverViewController: UIViewController {
    
    @IBOutlet weak var tfNombre: UITextField!
    
    var delegado : protocoloAgregarSet!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Configurar el tamaño de la vista
        preferredContentSize = CGSize(width: 250, height: 200)
    }
    
    //Obtener la dirección del folder para guardar los datos
    func dataFileURL() -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let pathArchivo = documentsDirectory.appendingPathComponent("KanjiSet").appendingPathExtension("plist")
        
        return pathArchivo
    }
    
    
    
    // Crear el nuevo set
    @IBAction func guardarSet(_ sender: UIButton) {
        //CHECAR ESTO
        let nuevoSet = KanjiSet(nombre: tfNombre.text!, listaKanji: [KanjiUsuario]())
        delegado.agregarSet(set: nuevoSet)
        dismiss(animated: true, completion: nil)
    }
    
    // Presionar el botón de cancelar
    @IBAction func btnCancelar(_ sender: UIButton) {
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
