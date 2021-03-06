//
//  KatakanaQuizViewController.swift
//  Hajime
//
//  Created by user189597 on 5/15/21.
//

import UIKit
import AVFoundation

class KatakanaQuizViewController: UIViewController {

    var defaults = UserDefaults.standard
    
    var currentSymbol: UInt32 = 0
    var score: Int = 0
    var highScore: Int = 0
    var rightAnswer: UInt32 = 0
    
    @IBOutlet weak var lbHighScore: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    @IBOutlet weak var lbSymbol: UILabel!
    @IBOutlet weak var btnA1: UIButton!
    @IBOutlet weak var btnA2: UIButton!
    @IBOutlet weak var btnA3: UIButton!
    @IBOutlet weak var btnA4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quiz"
        lbHighScore.text = String(defaults.integer(forKey: "katakana"))
        highScore = defaults.integer(forKey: "katakana")
        
        btnA1.layer.cornerRadius = 10
        btnA2.layer.cornerRadius = 10
        btnA3.layer.cornerRadius = 10
        btnA4.layer.cornerRadius = 10
        
        title = "Quiz"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
    }
    
    @IBAction func answer(_ sender: UIButton) {
        var audioPlayer: AVAudioPlayer?
        if sender.tag == Int(rightAnswer) {
            let pathToSound = Bundle.main.path(forResource: "correct", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            
            score += 1
            if score > highScore {
                highScore = score
                guardarDatosKatakanaRecord()
            }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                
            }
        }
        else {
            let pathToSound = Bundle.main.path(forResource: "wrong", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            
            if score > highScore {
                highScore = score
                guardarDatosKatakanaRecord()
            }
            score = 0	
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                
            }
        }
        
        defaults.setValue(highScore, forKey: "katakana")
        
        guardarDatos()
        
        nextQuestion()
    }
    
    func nextQuestion() {
        currentSymbol = arc4random_uniform(UInt32(katakana.count))
        rightAnswer = arc4random_uniform(4) + 1
        
        lbSymbol.text = katakana[Int(currentSymbol)].symbol
        lbScore.text = String(score)
        lbHighScore.text = String(highScore)
        
        var button = UIButton()
        var x = arc4random_uniform(UInt32(katakana.count))
        
        while x == currentSymbol {
            x = arc4random_uniform(UInt32(katakana.count))
        }
        
        for i in 1...4 {
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswer) {
                button.setTitle("     " + katakana[Int(currentSymbol)].reading + "     ", for: .normal)
            }
            else {
                button.setTitle("     " + katakana[Int(x)].reading + "     ", for: .normal)
                x = arc4random_uniform(UInt32(hiragana.count))
                
                while x == currentSymbol {
                    x = arc4random_uniform(UInt32(katakana.count))
                }
            }
        }
    }
    
    func guardarDatos() {
        let defaults = UserDefaults.standard
        
        defaults.setValue(true, forKey: "KatakanaG")
    }
    
    func guardarDatosKatakanaRecord() {
        let defaults = UserDefaults.standard
        
        defaults.setValue(true, forKey: "NewRecordK")
    }
    override var shouldAutorotate: Bool{
        return false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
