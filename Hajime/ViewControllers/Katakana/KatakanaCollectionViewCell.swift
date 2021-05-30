//
//  KatakanaCollectionViewCell.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 21/04/21.
//

import UIKit

class KatakanaCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lbKana: UILabel!
    @IBOutlet weak var lbReading: UILabel!
    
    //Funcion para llenar la celda. Es llamada en KatakanaGridViewController
    func setup(with kana: Kana){
        lbKana.text = kana.symbol
        lbReading.text = kana.reading
    }
}
