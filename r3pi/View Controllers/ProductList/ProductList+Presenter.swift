//
//  ProductList+Presenter.swift
//  r3pi
//
//  Created by Nazar on 29/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation

extension ProductListViewController
{
    //in the presenter we only "Adapt/Transform/Prepare" data before send it to the view
    //No business logic shoult be here!!!
    
    //in our case, this file will have a dumb look since it's so simple that we will just passing data, nothing more!
    
    func preFetchCurrencyData()
    {
        intFetchCurrencyData()
    }
    
    func preUpdateQuantity(forProductId productId:String, newQuantity:String)
    {
        intUpdateQuantity(forProductId: productId, newQuantity: newQuantity)
    }
    
    //This method will fillter all products with quantity greater than ZERO and will pass it to the checkout page
    //we wont consult Interctor since this is only a matter of data preparation for another MODULE
    func prepareDataForCheckout(products:[ProductModel]) -> [ProductModel]
    {
        var resultArray = [ProductModel]()
        
        for product in products {
            if let productQuantity = Int(product.quantity), productQuantity>0
            {
                resultArray.append(product)
            }
        }
        
        return resultArray
    }
    
    func preClearAllData()
    {
        intFetchCurrencyData()
    }
}

extension ProductListViewController
{
    //this extension just to separate channels of communication
    
    func sendDataToView(data:[ProductModel]?)
    {
        if let unrapedData = data {
            updateView(data: unrapedData)
        }
        else
        {
            updateView()
        }
    }
}
