//
//  ProductDetailsViewController.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

protocol ProductDetailsViewControllerDelegate {
    func updateQuantity(forProductId productId:String, newQuantity:String)
}

class ProductDetailsViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var unit: UILabel!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var applyBtn: UIButton!
    
    var productData:ProductModel?
    var newQuantity:Int = 0
    var delegate:ProductDetailsViewControllerDelegate?
    
    //pragma mark - VIEWS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupProductData(product:ProductModel)
    {
        productData = product
    }
    
    func setup()
    {
        if let product = productData {
            name.text = product.name
            unit.text = product.unit
            quantity.text = product.quantity
            imageView.image = UIImage(named: product.image)
            
            if let currentQuantity = Int(product.quantity) { newQuantity = currentQuantity }
        }
        
        
        applyBtn.alpha = 0
        UIView.animate(withDuration: 2, animations: {
            self.applyBtn.alpha = 1
        }, completion: nil)
    }

    
    
    //pragma mark - ACTIONS
    
    @IBAction func plusQuantityAction(_ sender: UIButton) {
        newQuantity += 1
        updateView()
    }
    
    
    @IBAction func minusQuantityAction(_ sender: UIButton) {
        if newQuantity>0 {
            newQuantity -= 1
            updateView()
        }
        else
        {
            //use native alert view with complete handler
            let alert = UIAlertController(title: "Quantity...", message: "Quantity below 0 doesn't exist in this world :)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func doneWindowAction(_ sender: UIButton) {
        //safe unwrap and check if there is a point to make updating because each update has it price (processing time)
        if let product = productData,
            Int(product.quantity) != newQuantity {
            delegate?.updateQuantity(forProductId: product.id, newQuantity: "\(newQuantity)")
        }
        closeWindow()
    }
    
    
    @IBAction func closeWindowAction(_ sender: UIButton) {
        closeWindow()
    }
    
    
    //pragma mark - GEneral
    
    fileprivate func closeWindow()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func updateView()
    {
        quantity.text = "\(newQuantity)"
    }
    
}
