//
//  ProductListViewController.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet var totalPurchaseQuantityLbl: UILabel!
    @IBOutlet var totalPurchaseCostLbl: UILabel!
    @IBOutlet var checkoutBtn: UIButton!
    
    let reuseIdentifier = "ProductCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many sections to make
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ProductCollectionViewCell
        //cell.delegate = self
        
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 5
        
        /*
        //we need to check, if this is last cell than we should add button and hide the image.
        if preGetDataLengt()==indexPath.item
        {
            //This transformation is delegated to the cell
            cell.setLastCell()
        }
        else
        {
            //get data for current row
            let imgModel = dataArray[indexPath.row]
            
            //set a image.. let's delegate this job to the cell itself
            cell.setImage(mImage: imgModel, isFavorite: false)
        }
        */
        
        return cell
    }
}
