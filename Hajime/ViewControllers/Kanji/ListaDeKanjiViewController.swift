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
            
        } else if segue.identifier == "estudiar" {
            
            let vistaEstudiar = segue.destination as! EstudiarViewController
            
            vistaEstudiar.listaKanji = setKanji.listaKanji
        }
        
    }
    

}

//MARK: - Configuración del Tableview
extension ListaDeKanjiViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setKanji.listaKanji.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaKanji") as! KanjiTableViewCell
        
        cell.lbCaracter?.text = setKanji.listaKanji[indexPath.row].caracter
        cell.lbLecturas?.text = setKanji.listaKanji[indexPath.row].pronunciacion
        cell.lbSignificados?.text = setKanji.listaKanji[indexPath.row].significado
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            setKanji.listaKanji.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
}

//MARK: - Protocolo para agregar nuevo kanji

extension ListaDeKanjiViewController: protocoloAgregarKanji {
    func agregarKanji(kanji: KanjiUsuario) {
        setKanji.listaKanji.append(kanji)
        tableView.reloadData()
    }
}
