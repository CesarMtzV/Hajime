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
        
        //Registrarse para las notificaciones
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(guardarSet), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        //Verificar si un archivo existe para cargar datos
        if FileManager.default.fileExists(atPath: dataFileURL().path){
            obtenerSets()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tvSets.reloadData()
    }
    
    // Darle estilo al botón
    func configurarBotones(){
        btnAgregar.layer.cornerRadius = 0.5 * btnAgregar.bounds.size.width
        btnAgregar.clipsToBounds = true
    }
    
    //Obtener la dirección del folder para guardar los datos
    func dataFileURL() -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let pathArchivo = documentsDirectory.appendingPathComponent("KanjiSet").appendingPathExtension("plist")
        
        return pathArchivo
    }
    
    //Funcion para guardar los datos a memoria
    @IBAction func guardarSet(){
        do {
            let data = try PropertyListEncoder().encode(listaDeSets)
            try data.write(to: dataFileURL())
        }catch {
            print("Error al guardar los datos")
        }
    }
    
    //Funcion para obtener los sets guardados en memoria
    func obtenerSets(){
        // Limpiar el arreglo
        listaDeSets.removeAll()
        
        //Cargar el archivo con los datos
        do{
            let data = try Data.init(contentsOf: dataFileURL())
            listaDeSets = try PropertyListDecoder().decode([KanjiSet].self, from: data)
        } catch {
            print("Error al cargar los datos del archivo")
        }
        
        //Refrescar los datos de la tabla
        tvSets.reloadData()
    }
    
    // Navegación
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "agregarGrupo" {
            let vistaPopOver = segue.destination as! CrearSetPopOverViewController

            vistaPopOver.popoverPresentationController?.delegate = self
            vistaPopOver.delegado = self
        }else if segue.identifier == "listaKanji" {
            let vistaDetalle = segue.destination as! ListaDeKanjiViewController
            
            let indice = tvSets.indexPathForSelectedRow!
            
            vistaDetalle.setKanji = listaDeSets[indice.row]
            
        }
        
    }

}

//MARK: - TableView

extension KanjiViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaGrupo")!
        let numKanji = String(listaDeSets[indexPath.row].listaKanji.count)
        cell.textLabel?.text = listaDeSets[indexPath.row].nombre
        cell.detailTextLabel?.text = "\(numKanji) kanji"
        
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            listaDeSets.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
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
    
    override var shouldAutorotate: Bool{
        return false
    }
}
