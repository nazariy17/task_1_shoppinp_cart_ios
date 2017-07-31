//
//  CheckoutViewController.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    
    @IBOutlet var currencyValue: UILabel!
    @IBOutlet var totalPriceInUSD: UILabel!
    @IBOutlet var totalPrice: UILabel!
    @IBOutlet var currencyBtn: UIButton!
    
    let reuseIdentifier = "CheckoutTableViewCell"
    var dataArray:[ProductModel] = [ProductModel]()
    var oldPriceinUSD:Double = 0
    
    //pragma mark - VIEWS
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //pragma mark - INIT
    func setupData(products: [ProductModel])
    {
        dataArray = products
    }
    
    fileprivate func setup()
    {
        self.navigationController?.customSetup() //setup white color and back button
        
        if dataArray.count<1 {
            
            //use native alert view with complete handler
            let alert = UIAlertController(title: "Notification", message: "Please, add at least 1 product to your basket", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
                self.closeWindow()
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            let totalValues = ProductModel.getTotalPriceinUSD(products: dataArray)
            oldPriceinUSD = totalValues.totalPrice //save current total price in USD
            
            totalPriceInUSD.text = "\(oldPriceinUSD)"
            currencyValue.text = "1" //since this is setup.. the value is USD, it means 1:1
            totalPrice.text = "\(oldPriceinUSD)" //currency 1:1
            
        }
        
    }
    
    
    
    //pragma mark - ACTIONS
    @IBAction func backAction(_ sender: UIButton) {
        //edit button is actually back button
        closeWindow()
    }
    
    @IBAction func confirmAndPayAction(_ sender: UIButton) {
        //use native alert view with complete handler
        let alert = UIAlertController(title: "Confirmation", message: "Do you really want to make this purchase?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes, I do!", style: UIAlertActionStyle.default, handler: { action in
            NotificationCenter.default.post(name: Notification.Name("clear_data"), object: nil)
            self.closeWindow()
        }))
        alert.addAction(UIAlertAction(title: "I change my mind", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    //pragma mark - general
    fileprivate func closeWindow()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //pragma mark - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CurrencyListSegue"
        {
            if let detailPage = segue.destination as? CurrencyListViewController {
                detailPage.delegate = self
            }
        }
    }
}



extension CheckoutViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CheckoutTableViewCell
        let index = (indexPath as NSIndexPath).row
        
        cell.setup(product: dataArray[index])
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension CheckoutViewController: CurrencyListViewControllerDelegate {
    func updateCurrency(newCurrency:CurrencyModel)
    {
        //update total price and label for currency value
        //in order to update currency value to only 3 decimal cases I will cast to Double and that back to String... not fancy, but it's much effective instead of trying to play with string
        if let currecnyValue = Double(newCurrency.value)
        {
            currencyValue.text = String(format: "%0.*f", 3, currecnyValue)
        }
        currencyBtn.setTitle(newCurrency.name, for: .normal)
        
        let newPrice = CurrencyModel.updatePriceForNewCurrency(oldPriceStr: "\(oldPriceinUSD)", currency: newCurrency)
        totalPrice.text = String(format: "%0.*f", 2, newPrice)
    }
}


