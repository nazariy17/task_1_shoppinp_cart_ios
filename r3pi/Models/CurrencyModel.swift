//
//  CurrencyModel.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation

class CurrencyModel: NSObject
{
    var name    = ""
    var value   = ""
    
    convenience init(dictionary: NSDictionary) {
        self.init()
        
        guard let name = dictionary["name"] as? String,
            let value = dictionary["value"] as? String
            else { return }
        
        self.name   = name
        self.value   = value
    }
}
