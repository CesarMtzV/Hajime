//
//  KanjiSet.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 15/05/21.
//

import UIKit

class KanjiSet: NSObject, Codable {
    var nombre : String
    var listaKanji = [KanjiUsuario]()
    
    init(nombre: String, listaKanji: [KanjiUsuario]) {
        self.nombre = nombre
        self.listaKanji = listaKanji
    }
}
