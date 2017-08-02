//
//  CurrencyListViewController.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

protocol CurrencyListViewControllerDelegate {
    func updateCurrency(newCurrency:CurrencyModel)
}

class CurrencyListViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    let reuseIdentifier = "CurrencyTableViewCell"
    var dataArray:[CurrencyModel] = [CurrencyModel]()
    var selectedIndexRow:Int = -1
    var delegate:CurrencyListViewControllerDelegate?
    
    
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
    func setup()
    {
        CustomLoader.sharedInstance.showLoader(parent: self.view)
        preFetchCurrencyData()
    }
    
    
    //pragma mark - ACTIONS
    
    @IBAction func doneWindowAction(_ sender: UIButton) {
        if selectedIndexRow > -1
        {
            delegate?.updateCurrency(newCurrency: dataArray[selectedIndexRow])
            closeWindow()
        }
        else
        {
            //use native alert view with complete handler
            let alert = UIAlertController(title: "Currency", message: "Please, select a valid currency from the list. Thank you", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil ))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func closeWindowAction(_ sender: UIButton) {
        closeWindow()
    }
    
    
    //pragma mark - general
    fileprivate func closeWindow()
    {
        self.dismiss(animated: true, completion: nil)
    }

}

extension CurrencyListViewController: UITableViewDataSource, UITableViewDelegate {
    
    //pragma mark - Table View Delegates
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let index = (indexPath as NSIndexPath).row
        
        let curModel = dataArray[index] 
        cell.textLabel?.text = "\(curModel.name) - \(curModel.value)"
        
        return cell
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexRow = indexPath.row
    }
    
}

extension CurrencyListViewController {
    //Extention to make communication between Presenter and View
    
    func updateView(data:[CurrencyModel])
    {
        CustomLoader.sharedInstance.hideLoader()
        if data.count < 1
        {
            
            //use native alert view with complete handler
            let alert = UIAlertController(title: "Notification", message: "It seems like you have no internet connection. Please, try again later.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
                self.closeWindow()
            }))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        dataArray.removeAll()
        dataArray = data
        tableView.reloadData()
    }
}
