//
//  KanjiTableViewCell.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 24/05/21.
//

import UIKit

class KanjiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbLecturas: UILabel!
    @IBOutlet weak var lbSignificados: UILabel!
    @IBOutlet weak var lbCaracter: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
