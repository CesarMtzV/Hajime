//
//  Logros.swift
//  Hajime
//
//  Created by Alex Vargas  on 04/05/21.
//

import UIKit

class Logros: NSObject {
    var nombre : String = ""
    var detalle : String = ""
    var img : UIImage!
    
    init (nombre: String, detalle: String, img: UIImage){
        self.nombre = nombre
        self.detalle = detalle
        self.img = img
    }

}
