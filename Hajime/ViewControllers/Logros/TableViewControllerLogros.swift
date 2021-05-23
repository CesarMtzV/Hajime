//
//  TableViewControllerLogros.swift
//  Hajime
//
//  Created by Alex Vargas  on 18/04/21.
//

import UIKit

class TableViewControllerLogros: UITableViewController {
    
    var ArrLogros = [
        Logros(nombre: "Random", detalle: "You generated your first random kanji", img: UIImage(imageLiteralResourceName: "dice.png")),
        Logros(nombre: "ひらがな", detalle: "You practiced Hiragana for the first time", img: UIImage(imageLiteralResourceName: "a.png")),
        Logros(nombre: "カタカナ", detalle: "You practiced Katakana for the first time", img: UIImage(imageLiteralResourceName: "ka.png")),
        Logros(nombre: "New alerts", detalle: "You turned notifications on", img: UIImage(imageLiteralResourceName: "noti.jpeg")),
        Logros(nombre: "New record!", detalle: "You broke your record studying Hiragana", img: UIImage(imageLiteralResourceName: "hiragan.png")),
        Logros(nombre: "感じ", detalle: "You created your first Kanji deck", img: UIImage(imageLiteralResourceName: "kanji-1.jpeg")),
        Logros(nombre: "Artist", detalle: "You drew your first Kanji", img: UIImage(imageLiteralResourceName: "art.png")),
        Logros(nombre: "New record!", detalle: "You broke your record studying Katakana", img: UIImage(imageLiteralResourceName: "katakana-1.png")),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        title = "Logros"
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
    

}
