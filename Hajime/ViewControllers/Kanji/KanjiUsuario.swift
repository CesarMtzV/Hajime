//
//  KanjiUsuario.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 14/05/21.
//

import UIKit

class KanjiUsuario: Codable {
    
    var caracter: String
    var pronunciacion: String
    var significado: String
    var ejemplo: String
    
    init(caracter : String, pronunciacion: String, significado: String, ejemplo: String){
        self.caracter = caracter
        self.pronunciacion = pronunciacion
        self.significado = significado
        self.ejemplo = ejemplo
    }
}
