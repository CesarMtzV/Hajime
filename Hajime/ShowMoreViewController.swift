//
//  ShowMoreViewController.swift
//  Hajime
//
//  Created by Alex Vargas  on 17/04/21.
//

import UIKit

class ShowMoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchKanjiData { (kanji) in
            for kanjiData in kanji {
                print(kanjiData.kanji)

            }
        }

        
    }
    
    func fetchKanjiData(completionHandler: @escaping ([kanjiData]) -> Void){
        let url = URL(string: "https://kanjiapi.dev/v1/kanji/%E6%97%A5")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let data=data else {return}
            
            do{
                let KanjiData = try JSONDecoder().decode([kanjiData].self, from: data)
                
                completionHandler(KanjiData)
            }catch{ 
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
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

