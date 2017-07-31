//
//  CheckoutTableViewCell.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    
    @IBOutlet var quantity: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var totalPrice: UILabel!
    @IBOutlet var uiImageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var unit: UILabel!

    
    func setup(product:ProductModel) {
        uiImageView.image = UIImage(named: product.image)
        name.text = product.name
        unit.text = product.unit
        quantity.text = product.quantity
        
        if let doubleQuantity = Double(product.quantity), let doublePrice = Double(product.price)
        {
            totalPrice.text = String(format: "$ %0.*f", 2, (doubleQuantity*doublePrice))
        }
        else
        {
            totalPrice.text = "$ 0"
        }
    }
}
