//
//  CurrencyListViewController.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class CurrencyListViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    let reuseIdentifier = "CurrencyTableViewCell"
    var dataArray:[CurrencyModel] = [CurrencyModel]()
    
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
        preFetchCurrencyData()
    }
    
    
    //pragma mark - ACTIONS
    
    @IBAction func doneWindowAction(_ sender: UIButton) {
    }
    
    
    @IBAction func closeWindowAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //pragma mark - general

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
        /*
         selectedRowIndex = (indexPath as NSIndexPath).row
         selectionAction?(selectedRowIndex!, dataSource[selectedRowIndex!])
         
         if let _ = anchorView as? UIBarButtonItem {
         // DropDown's from UIBarButtonItem are menus so we deselect the selected menu right after selection
         deselectRow(at: selectedRowIndex)
         }
         
         hide()
         */
    }
    
}

extension CurrencyListViewController {
    //Extention to make communication between Presenter and View
    
    func updateView(data:[CurrencyModel])
    {
        dataArray.removeAll()
        dataArray = data
        tableView.reloadData()
    }
}
