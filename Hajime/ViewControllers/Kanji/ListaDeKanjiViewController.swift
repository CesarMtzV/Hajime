//
//  ListaDeKanjiViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 19/05/21.
//

import UIKit

protocol protocoloAgregarKanji {
    func agregarKanji(kanji: KanjiUsuario)
}

class ListaDeKanjiViewController: UIViewController, protocoloAgregarkanji {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAgregar: UIButton!
    
    var setKanji : KanjiSet!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurarBotones()
    }
    
    // Darle estilo al botón
    func configurarBotones(){
        btnAgregar.layer.cornerRadius = 0.5 * btnAgregar.bounds.size.width
        btnAgregar.clipsToBounds = true
    }
    

    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "agregarKanji" {
            let vistaAgregar = segue.destination as! AddKanjiViewController
            
            vistaAgregar.delegadoKanji = self
        } else if segue.identifier == "kanjiDetalle" {
            let vistaDetalle = segue.destination as! KanjiDetallesViewController
            let indice = tableView.indexPathForSelectedRow!
            vistaDetalle.kanjiSeleccionado = setKanji.listaKanji[indice.row]
        }
        
    }
    

}

//MARK: - Configuración del Tableview
extension ListaDeKanjiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setKanji.listaKanji.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaKanji")!
        
        cell.textLabel?.text = setKanji.listaKanji[indexPath.row].caracter
        
        return cell
    }
    
    
}

//MARK: - Protocolo para agregar nuevo kanji

extension ListaDeKanjiViewController: protocoloAgregarKanji {
    func agregarKanji(kanji: KanjiUsuario) {
        setKanji.listaKanji.append(kanji)
        tableView.reloadData()
    }
}
