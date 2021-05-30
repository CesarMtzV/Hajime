//
//  TableViewControllerLogros.swift
//  Hajime
//
//  Created by Alex Vargas  on 18/04/21.
//

import UIKit

class TableViewControllerLogros: UITableViewController {
    
    var ArrLogros = [
        Logros(nombre: "Random", detalle: "You generated your first random kanji", img: UIImage(imageLiteralResourceName: "dice.png"), status: false),
        Logros(nombre: "ひらがな", detalle: "You practiced Hiragana for the first time", img: UIImage(imageLiteralResourceName: "a.png"), status: false),
        Logros(nombre: "カタカナ", detalle: "You practiced Katakana for the first time", img: UIImage(imageLiteralResourceName: "ka.png"), status: false),
        Logros(nombre: "New alerts", detalle: "You turned notifications on", img: UIImage(imageLiteralResourceName: "noti.jpeg"), status: false),
        Logros(nombre: "New record!", detalle: "You broke your record studying Hiragana", img: UIImage(imageLiteralResourceName: "hiragan.png"), status: false),
        Logros(nombre: "感じ", detalle: "You created your first Kanji deck", img: UIImage(imageLiteralResourceName: "kanji-1.jpeg"), status: false),
        Logros(nombre: "Artist", detalle: "You drew your first Kanji", img: UIImage(imageLiteralResourceName: "art.png"), status: false),
        Logros(nombre: "New record!", detalle: "You broke your record studying Katakana", img: UIImage(imageLiteralResourceName: "katakana-1.png"), status: false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        

        actualizarInterfaz()

        title = "Achievements"

    }    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ArrLogros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = ArrLogros[indexPath.row].nombre
        return cell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaLogrosMas = segue.destination as! ViewControllerLogroMas
        
        let indice = tableView.indexPathForSelectedRow!
        
        vistaLogrosMas.LogrosMas = ArrLogros[indice.row]
    }
    
    func actualizarInterfaz(){
        let defaults = UserDefaults.standard
        
        //logro1
        ArrLogros[0].status = defaults.bool(forKey: "Random")
        
        //logro2
        ArrLogros[1].status = defaults.bool(forKey: "Hiragana")
        
        //logro3
        ArrLogros[2].status = defaults.bool(forKey: "KatakanaG")
        
        //logro3
        ArrLogros[3].status = defaults.bool(forKey: "NewAlerts")
        
        //logro3
        ArrLogros[4].status = defaults.bool(forKey: "NewRecordH")
        
        //logro3
        ArrLogros[5].status = defaults.bool(forKey: "Kanji")
        
        //logro3
        ArrLogros[6].status = defaults.bool(forKey: "Artist")
        
        //logro3
        ArrLogros[7].status = defaults.bool(forKey: "NewRecordK")
        
        
    }
    override var shouldAutorotate: Bool{
        return false
    }

}
