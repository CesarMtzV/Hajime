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
    @IBOutlet weak var lbKun2: UILabel!
    @IBOutlet weak var lbKun3: UILabel!
    @IBOutlet weak var lnOn: UILabel!
    @IBOutlet weak var lbOn2: UILabel!
    @IBOutlet weak var lbOn3: UILabel!
    @IBOutlet weak var lbSig: UILabel!
    @IBOutlet weak var lbSig2: UILabel!
    @IBOutlet weak var lbSig3: UILabel!
    
    
    var KanjiData:kanjiData!
    var validar : Bool = true
    
    var randomIndex : Int = Int.random(in: 0..<KanjiList.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fetchKanjiData() {
            lbKanji.text = KanjiData.kanji
            lbTrazos.text = String(KanjiData.stroke_count)
            if KanjiData.kun_readings.isEmpty {
                lbKun.text = "Kun N/A"
            }else{
                lbKun.text = KanjiData.kun_readings[0]
                if (KanjiData.kun_readings.count > 1){
                    lbKun2.text = KanjiData.kun_readings[1]
                    if (KanjiData.kun_readings.count > 2){
                        lbKun3.text = KanjiData.kun_readings[2]
                    }
                }
            }
            if KanjiData.on_readings.isEmpty {
                lnOn.text = "On N/A"
            }else{
                lnOn.text = KanjiData.on_readings[0]
                if (KanjiData.on_readings.count > 1){
                    lbOn2.text = KanjiData.on_readings[1]
                    if (KanjiData.on_readings.count > 2){
                        lbOn3.text = KanjiData.on_readings[2]
                    }
                }
            }
            lbSig.text = KanjiData.meanings[0]
            if (KanjiData.meanings.count > 1){
                lbSig2.text = KanjiData.meanings[1]
                if (KanjiData.meanings.count > 2){
                    lbSig3.text = KanjiData.meanings[2]
                }
            }
        }
    }
      
    @IBAction func btGenerar(_ sender: UIButton) {
        randomIndex = Int.random(in: 0..<KanjiList.count)
        
        KanjiData.kun_readings.removeAll()
        KanjiData.on_readings.removeAll()
        KanjiData.meanings.removeAll()
        
        if fetchKanjiData() {
            lbKanji.text = KanjiData.kanji
            lbTrazos.text = String(KanjiData.stroke_count)
            if KanjiData.kun_readings.isEmpty {
                lbKun.text = "Kun N/A"
                lbKun2.text = nil
                lbKun3.text = nil
            }else{
                lbKun.text = KanjiData.kun_readings[0]
                lbKun2.text = nil
                lbKun3.text = nil
                if (KanjiData.kun_readings.count > 1){
                    lbKun2.text = KanjiData.kun_readings[1]
                    lbKun3.text = nil
                    if (KanjiData.kun_readings.count > 2){
                        lbKun3.text = KanjiData.kun_readings[2]
                    }
                }
            }
            if KanjiData.on_readings.isEmpty {
                lnOn.text = "On N/A"
                lbOn2.text = nil
                lbOn3.text = nil
            }else{
                lnOn.text = KanjiData.on_readings[0]
                lbOn2.text = nil
                lbOn3.text = nil
                if (KanjiData.on_readings.count > 1){
                    lbOn2.text = KanjiData.on_readings[1]
                    lbOn3.text = nil
                    if (KanjiData.on_readings.count > 2){
                        lbOn3.text = KanjiData.on_readings[2]
                    }
                }
            }
            lbSig.text = KanjiData.meanings[0]
            lbSig2.text = nil
            lbSig3.text = nil
            if (KanjiData.meanings.count > 1){
                lbSig2.text = KanjiData.meanings[1]
                lbSig3.text = nil
                if (KanjiData.meanings.count > 2){
                    lbSig3.text = KanjiData.meanings[2]
                }
            }
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

