//
//  CurrencyList+Presenter.swift
//  r3pi
//
//  Created by Nazar on 30/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation

extension CurrencyListViewController
{
    //in the presenter we only "Adapt/Transform/Prepare" data before send it to the view
    //No business logic shoult be here!!!
    
    //in our case, this file will have a dumb look since it's so simple that we will just passing data, nothing more!
    
    func preFetchCurrencyData()
    {
        intFetchCurrencyData()
    }
}

extension CurrencyListViewController
{
    //this extension just to separate channels of communication
    
    func sendDataToView(data:[CurrencyModel])
    {
        updateView(data: data)
    }
}
