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
        title = "References"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override var shouldAutorotate: Bool{
        return false
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
        cell.layer.cornerRadius = 8
        //Funcion para llenar los valores de la celda. Esta declaradda en KatakanaCollectionViewCell
        cell.setup(with: katakana[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
    }
    
}

//Darle estilo a la celda
extension KatakanaGridViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
