//
//  ProductDetailsViewController.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var unit: UILabel!
    @IBOutlet var quantity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func plusQuantityAction(_ sender: UIButton) {
    }
    
    
    @IBAction func minusQuantityAction(_ sender: UIButton) {
    }
    
    
    @IBAction func doneWindowAction(_ sender: UIButton) {
    }
    
    
    @IBAction func closeWindowAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
