//
//  HiraganaGridViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 19/04/21.
//

import UIKit

class HiraganaGridViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Configurar la Navbar superior
        title = "Referencias"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

}

extension HiraganaGridViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hiragana.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HiraganaCollectionViewCell", for: indexPath) as! HiraganaCollectionViewCell
        
        cell.setup(with: hiragana[indexPath.row])
        
        return cell
    }
}

extension HiraganaGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
