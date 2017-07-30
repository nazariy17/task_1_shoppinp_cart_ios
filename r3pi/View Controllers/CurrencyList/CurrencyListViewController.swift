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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneWindowAction(_ sender: UIButton) {
    }
    
    
    @IBAction func closeWindowAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension CurrencyListViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CurrencyTableViewCell
        //let index = (indexPath as NSIndexPath).row
        
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
