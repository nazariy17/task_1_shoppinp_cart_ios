//
//  ProductModel.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation

class ProductModel: NSObject
{
    var id          = ""
    var name        = ""
    var unit        = ""
    var price       = ""
    var image       = ""
    var quantity    = "0"
    
    convenience init(dictionary: NSDictionary) {
        self.init()
        
        guard let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let unit = dictionary["unit"] as? String,
            let price = dictionary["price"] as? String,
            let image = dictionary["image"] as? String
            else {
                print("Problem initializing the Product Model with dictionary: \(dictionary)")
                return }
        
        self.id     = id
        self.name   = name
        self.unit   = "$\(price) \(unit)"
        self.price  = price
        self.image  = image
        
        if let quantity = dictionary["quantity"] as? String {
            self.quantity = quantity
        }
    }
    
    class func getTotalPriceinUSD(products:[ProductModel]) -> (totalQuantity:Double, totalPrice:Double)
    {
        var totalQuantity:Double = 0
        var totalPrice:Double = 0
        
        for product in products
        {
            if let currentQuantity = Double(product.quantity), let currentPrice = Double(product.price) {
                totalQuantity += currentQuantity
                totalPrice += currentQuantity * currentPrice
            }
        }
        
        return ( totalQuantity, totalPrice )
    }
}
