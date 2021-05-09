//
//  ShowMoreViewController.swift
//  Hajime
//
//  Created by Alex Vargas  on 17/04/21.
//

import UIKit

class ShowMoreViewController: UIViewController {
    @IBOutlet weak var lbKanji: UILabel!
    @IBOutlet weak var lbTrazos: UILabel!
    @IBOutlet weak var lbKun: UILabel!
    @IBOutlet weak var lnOn: UILabel!
    @IBOutlet weak var lbSig: UILabel!
    
    var KanjiData:kanjiData!
    var validar : Bool = true
    
    var randomIndex : Int = Int.random(in: 0..<KanjiList.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fetchKanjiData() {
            lbKanji.text = KanjiData.kanji
            lbTrazos.text = String(KanjiData.stroke_count)
            if KanjiData.kun_readings.isEmpty {
                lbKun.text = "No hay lectura Kun"
            }else{
                lbKun.text = KanjiData.kun_readings[0]
            }
            lnOn.text = KanjiData.on_readings[0]
            lbSig.text = KanjiData.meanings[0]
            
        }

    }
      
    @IBAction func btGenerar(_ sender: UIButton) {
        randomIndex = Int.random(in: 0..<KanjiList.count)
        if fetchKanjiData() {
            lbKanji.text = KanjiData.kanji
            lbTrazos.text = String(KanjiData.stroke_count)
            if KanjiData.kun_readings.isEmpty {
                lbKun.text = "No hay lectura Kun"
            }else{
                lbKun.text = KanjiData.kun_readings[0]
            }
            lnOn.text = KanjiData.on_readings[0]
            lbSig.text = KanjiData.meanings[0]
            
        }
    }
    
    
    
    func fetchKanjiData() -> Bool{
        
        let kanji: Data? = KanjiList[randomIndex].data(using: .utf8) // non-nil
        
        let h1 = String(kanji![0], radix: 16)
        let h2 = String(kanji![1], radix: 16)
        let h3 = String(kanji![2], radix: 16)
        
        let url = URL(string: "https://kanjiapi.dev/v1/kanji/%\(h1)%\(h2)%\(h3)")!
        
        //let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        let dataOrigen = try? Data.init(contentsOf: url)
        
            guard let data=dataOrigen else {
                return false}
            
            do{
                self.KanjiData = try JSONDecoder().decode(kanjiData.self, from: data)
                validar = true
                
            }catch{ 
                let error = error
                print(error.localizedDescription)
                validar = false
            }
        
        return validar
    }
            
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     private func getKanji(from url: String){
         let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
             
             guard let data=data, error == nil else {
                 print("Something went wrong")
                 return
             }
             
             var result: kanjiData?
             do{
                 result = try JSONDecoder().decode(kanjiData.self, from: data)
             }catch{
                 print("failed")
             }
             
             guard let json = result else{
                 return
             }
             
             print(json.kanji)
         })
         
         task.resume()
     }
    */

}

