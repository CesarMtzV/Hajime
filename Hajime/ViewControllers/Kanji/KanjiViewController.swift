//
//  KanjiViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 24/04/21.
//

import UIKit

class KanjiViewController: UIViewController {
    
    @IBOutlet weak var btnAgregar: UIButton!
    @IBOutlet weak var tvSets: UITableView!
    
    var listaDeSets = [KanjiSet]()
    
    // Variable recibida del PopOver
    var nuevaCategoria : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Kanji"
        configurarBotones()
    }
    
    // Darle estilo al botón
    func configurarBotones(){
        btnAgregar.layer.cornerRadius = 0.5 * btnAgregar.bounds.size.width
        btnAgregar.clipsToBounds = true
    }
    
    // Navegación
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaPopOver = segue.destination as! CrearSetPopOverViewController

        vistaPopOver.popoverPresentationController?.delegate = self
        vistaPopOver.delegado = self
    }
    

}

//MARK: - TableView

extension KanjiViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaGrupo")!
        cell.textLabel?.text = listaDeSets[indexPath.row].nombre
        cell.detailTextLabel?.text = String(listaDeSets[indexPath.row].listaKanji.count)
        
        return cell
    }
    
    
}

//MARK: - PopOver

extension KanjiViewController : UIPopoverPresentationControllerDelegate {
    
    //No adaptarse al tamaño del dispositivo donde se ejecute
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

//MARK: - Protocolo para añadir nuevo set
extension KanjiViewController : protocoloAgregarSet {
    func agregarSet(set: KanjiSet) {
        listaDeSets.append(set)
        tvSets.reloadData()
    }
    
    
}
