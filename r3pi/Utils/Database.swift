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
    class func getAllDataFromPlist() -> [ProductModel]
    {
        var products = [ProductModel]()
        if let URL = Bundle.main.url(forResource: "products", withExtension: "plist") {
            if let productsFromPlist = NSArray(contentsOf: URL) {
                products = convertDictArrayToModelArray(dictionaries: productsFromPlist)
            }
        }
        return products
    }
    
    
    //save all data into NS USER DEFAULTS
    class func saveAllData(dictionary:NSDictionary)
    {
        let dict:[String:String] = ["key":"Hello"]
        UserDefaults.standard.set(dict, forKey: "dict")
        let result = UserDefaults.standard.value(forKey: "dict")
        print(result!)
    }
    
    
    //retriev all data into NS USER DEFAULTS
    class func fetchAllData() -> NSDictionary
    {
        let result = UserDefaults.standard.value(forKey: "dict")
        return result as! NSDictionary
    }
    
    
    // Aditional Functions
    
    private class func convertProductModelArrayToDictionaryArray(products:[ProductModel]) -> [NSDictionary]
    {
        var dictionaries = [NSDictionary]()
        for product in products {
            let dictionary:[String:String] = [
                "id":product.id,
                "name": product.name,
                "quantity":product.quantity,
                "image":product.image,
                "unit":product.unit
            ]
            dictionaries.append(dictionary as NSDictionary)
        }
        return dictionaries
    }
    
    private class func convertDictArrayToModelArray(dictionaries:NSArray) ->[ProductModel]
    {
        var products = [ProductModel]()
        for dictionary in dictionaries {
            let product = ProductModel(dictionary: dictionary as! NSDictionary)
            products.append(product)
        }
        return products
    }
}
