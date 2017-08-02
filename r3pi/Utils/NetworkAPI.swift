//
//  NetworkAPI.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation

class NetworkAPI
{
    let curencyServiceURL = "http://www.apilayer.net/api/live?format=1"
    let currencyApiKey = "445b7568e43d6b8c4ce93a15951f8aea"
    let currencies = "currencies=CHF,EUR,GBP,CAD,PLN,UAH,CAD"
    
    func getCurrencyList( callback: (([String:Any])->())? )
    {
        let fullStringURL = "\(curencyServiceURL)&access_key=\(currencyApiKey)&\(currencies)"
        
        if let url = URL(string: fullStringURL) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if (error != nil)
                {
                    //we should handle this error in more proper way
                    print("Error: \(error.debugDescription)")
                    
                    OperationQueue.main.addOperation {
                        callback?([String:Any]())
                    }
                }
                else
                {
                    do {
                        let responseData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                        
                        OperationQueue.main.addOperation {
                            callback?(responseData)
                        }
                    }
                    catch let error as NSError
                    {
                        //we should handle this error in more proper way
                        print("Error: \(error.debugDescription)")
                        
                        OperationQueue.main.addOperation {
                            callback?([String:Any]())
                        }
                    }
                }
            })
            
            task.resume()
        /* RESPONSE
            {
                success: true,
                terms: "https://currencylayer.com/terms",
                privacy: "https://currencylayer.com/privacy",
                timestamp: 1501426745,
                source: "USD",
                quotes: {
                    USDAED: 3.672804,
                    USDAFN: 68.300003,
                    USDALL: 113.320403,
                    USDAMD: 478.149994,
                    USDANG: 1.770403,
                    USDAOA: 165.093002,
                    USDARS: 17.797001,
                    USDAUD: 1.250304,
                    USDAWG: 1.79
                }
            }
        */
        }
    }
}
