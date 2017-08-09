//
//  ProductCollectionViewCell.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var quantity: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var unit: UILabel!
    
    //usually I would use some struct.. but in this case I will go with Model itself
    func setup(product:ProductModel) {
        imageView.alpha = 0
        imageView.image = UIImage(named: product.image)
        name.text = product.name
        unit.text = product.unit
        quantity.text = product.quantity
        
        UIView.animate(withDuration: 1, animations: { [unowned self] in
            self.imageView.alpha = 1
        }, completion: nil)
    }
}
