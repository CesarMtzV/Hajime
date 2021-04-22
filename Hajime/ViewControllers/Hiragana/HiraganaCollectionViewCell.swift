//
//  HiraganaCollectionViewCell.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 21/04/21.
//

import UIKit

class HiraganaCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lbSymbol: UILabel!
    @IBOutlet weak var lbReading: UILabel!
    
    func setup(with kana: Kana){
        lbSymbol.text = kana.symbol
        lbReading.text = kana.reading
    }
    
}
