//
//  ProductListViewController.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var totalPurchaseQuantity: UILabel!
    @IBOutlet var totalPurchasePrice: UILabel!
    @IBOutlet var checkoutBtn: UIButton!
    
    let reuseIdentifier = "ProductCollectionViewCell"
    var dataArray:[ProductModel] = [ProductModel]()

    //pragma mark - VIEWS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //pragma mark - INIT
    func setup()
    {
        preFetchCurrencyData()
    }
    
    
    //pragma mark - ACTIONS
    
    
    //pragma mark - general
    fileprivate func updateHeader()
    {
        let headerValues = ProductModel.getTotalPriceinUSD(products: dataArray)
        
        totalPurchaseQuantity.text = String(format: "%0.*f", 0, headerValues.totalQuantity)
        totalPurchasePrice.text = String(format: "%0.*f", 2, headerValues.totalPrice)
        
    }
    
    
    //pragma mark - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetailsSegue"
        {
            if let detailPage = segue.destination as? ProductDetailsViewController {
                let selectedCell = sender as! UICollectionViewCell
                let indexPath = collectionView?.indexPath(for: selectedCell)
                
                if let index = indexPath {
                    let product = dataArray[index.row]
                    detailPage.setupProductData(product: product)
                    detailPage.delegate = self
                }
            }
        }
        else if segue.identifier == "CheckoutSegue"
        {
            if let detailPage = segue.destination as? CheckoutViewController {
                detailPage.setupData(products: prepareDataForCheckout(products: dataArray))
            }
        }
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
        return dataArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ProductCollectionViewCell
        cell.setup(product: dataArray[indexPath.row])
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.r3piOrange().cgColor
        cell.layer.cornerRadius = 5
        
        return cell
    }
}



extension ProductListViewController {
    //Extention to make communication between Presenter and View
    
    func updateView(data:[ProductModel])  //This update is used when we receive data from internet / PLIST
    {
        dataArray.removeAll()
        dataArray = data
        updateHeader()
        collectionView.reloadData()
    }
    
    func updateView() //This update is used when we updated the product Quantity ONLY
    {
        updateHeader()
        collectionView.reloadData()
    }
}

extension ProductListViewController: ProductDetailsViewControllerDelegate {
    func updateQuantity(forProductId productId:String, newQuantity:String)
    {
        preUpdateQuantity(forProductId: productId, newQuantity: newQuantity)
    }
}
