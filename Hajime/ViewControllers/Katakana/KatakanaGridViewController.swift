//
//  KatakanaGridViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 21/04/21.
//

import UIKit

class KatakanaGridViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Referencias"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    

}

extension KatakanaGridViewController: UICollectionViewDataSource {
    
    //Numero de items en una seccion
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return katakana.count
    }
    
    //Definir la celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KatakanaCollectionViewCell", for: indexPath) as! KatakanaCollectionViewCell
        
        //Funcion para llenar los valores de la celda. Esta declaradda en KatakanaCollectionViewCell
        cell.setup(with: katakana[indexPath.row])
        return cell
    }
    
}

//Darle estilo a la celda
extension KatakanaGridViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
