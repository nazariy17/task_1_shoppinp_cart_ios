//
//  Database.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation


class Database
{
    //retriev data from PLIST. Should be ONLY used durong the APP init
    class func getAllDataFromPlist() -> [ProductModel] {
        var products = [ProductModel]()
        if let URL = Bundle.main.url(forResource: "products", withExtension: "plist") {
            if let productsFromPlist = NSArray(contentsOf: URL) {
                for dictionary in productsFromPlist {
                    let product = ProductModel(dictionary: dictionary as! NSDictionary)
                    products.append(product)
                }
            }
        }
        return products
    }
    
    
    //save all data into NS USER DEFAULTS
    class func saveAllData()
    {
        
    }
    
    
    //retriev all data into NS USER DEFAULTS
    class func fetchAllData()
    {
        
    }
    
    
    func convertProductModelToDictionary(product:ProductModel) -> NSDictionary {
        return NSDictionary()
    }
}
