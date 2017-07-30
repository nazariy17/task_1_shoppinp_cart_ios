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
    var name    = ""
    var unit    = ""
    var price   = ""
    var image   = ""
    
    convenience init(dictionary: NSDictionary) {
        self.init()
        
        guard let name = dictionary["name"] as? String,
            let unit = dictionary["unit"] as? String,
            let price = dictionary["price"] as? String,
            let image = dictionary["image"] as? String
            else { return }
        
        self.name   = name
        self.unit   = unit
        self.price  = price
        self.image  = image
    }
}
