//
//  CurrencyList+Interactor.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation

extension CurrencyListViewController
{
    //in the interactor we only care about data and business logic and heavy calcs We don't care about view and how we need to send the data to it.
    //All business logic shoult be here!!! Interactions with Networking services and Database also.
    
    func intFetchCurrencyData()
    {
        let networkAPI = NetworkAPI()
        networkAPI.getCurrencyList(callback: { (result) -> Void in
            
            let boolResult = result["success"] as! Bool
            if !boolResult {
                print("ERROR - boolResult")
                //Shwo alert screen with error!
                return
            }
            
            let rawCurrencyArray:[String:Double] = result["quotes"] as! [String : Double] //raw data from JSON
            var resultArray = [CurrencyModel]() //the result array we will be sending after append all necessary data
            
            for (key, value) in rawCurrencyArray {
                let tmpCurrenceModel = CurrencyModel()
                tmpCurrenceModel.name = key.chopPrefix(3) //let's remove 3 first chars in order to clean the name 
                tmpCurrenceModel.value = "\(value)"
                resultArray.append(tmpCurrenceModel)
            }
            
            self.sendDataToView(data: resultArray)
        })
    }
}
