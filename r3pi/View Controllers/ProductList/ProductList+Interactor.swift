//
//  ProductList+Interactor.swift
//  r3pi
//
//  Created by Nazar on 29/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation

extension ProductListViewController
{
    //in the interactor we only care about data and business logic and heavy calcs We don't care about view and how we need to send the data to it.
    //All business logic shoult be here!!! Interactions with Networking services and Database also.
    
    func intFetchCurrencyData()
    {
        //I decided to use ASYNK task just to show how I would do in commercial approach.
        //In this task it doesn't matter since we have only 4 products
        var resultArray = [ProductModel]()
        
        DispatchQueue(label: "background").async {
            autoreleasepool {
                resultArray = Database.getAllDataFromPlist()
            }
            
            OperationQueue.main.addOperation {
                self.sendDataToView(data: resultArray)
            }
            
        }
    }
    
    func intUpdateQuantity(forProductId productId:String, newQuantity:String)
    {
        //iterate our product Array - actually it isn't a good idea in case we would have 100 products. The cost for doing this would be too hight
        //in this case we would USE REALM or CORE DATA and problem would be solve much easier
        
        var i=0
        for product in dataArray {
            if product.id == productId {
                dataArray[i].quantity = newQuantity
            }
            i += 1
        }
        self.sendDataToView(data: nil)
    }
    
}
