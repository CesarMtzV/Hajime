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

class ListaDeKanjiViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var setKanji : KanjiSet!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    

}

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
