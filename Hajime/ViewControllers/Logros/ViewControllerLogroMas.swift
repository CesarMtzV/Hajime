//
//  ViewControllerLogroMas.swift
//  Hajime
//
//  Created by Alex Vargas  on 18/04/21.
//

import UIKit

class ViewControllerLogroMas: UIViewController {
    
    @IBOutlet weak var lbLogro: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbCompleted: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let limit = Progress(totalUnitCount: 10)
    
    var LogrosMas : Logros!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbLogro.text = LogrosMas.nombre
        
        lbDesc.text = LogrosMas.detalle
        
        img.image = LogrosMas.img
        
        if LogrosMas.status == true {
            limit.completedUnitCount += 10
            let progreso = Float(limit.fractionCompleted)
            progressView.setProgress(progreso, animated: true)
            lbCompleted.text = "100 %"
        }

        // Do any additional setup after loading the view.
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
