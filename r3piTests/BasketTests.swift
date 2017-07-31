//
//  ProductListTests.swift
//  r3pi
//
//  Created by Nazar on 31/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import XCTest
@testable import r3pi


class BasketTests: XCTestCase {
    
    var currencyCHF:CurrencyModel = CurrencyModel()
    var currencyEUR:CurrencyModel = CurrencyModel()
    var currencyUAH:CurrencyModel = CurrencyModel() // Ukrainian currence ... just wanted to pick up some that is greater than 1
    
    var productEggs:ProductModel = ProductModel()
    var productMilk:ProductModel = ProductModel()
    var products:[ProductModel] = [ProductModel]()
    
    override func setUp() {
        super.setUp()
        
        productEggs.id = "id-eggs"
        productEggs.name = "Eggs"
        productEggs.unit = "per dozen"
        productEggs.price = "2.10"
        productEggs.image = "eggs_preview"
        productEggs.quantity = "6"
        
        productMilk.id = "id-milk"
        productMilk.name = "Milk"
        productMilk.unit = "per bottle"
        productMilk.price = "1.30"
        productMilk.image = "milk_preview"
        productMilk.quantity = "10"
        
        products.append(productEggs)
        products.append(productMilk)
        
        currencyCHF.name = "CHF"
        currencyCHF.value = "0.97"
        
        currencyEUR.name = "EUR"
        currencyEUR.value = "0.85"
        
        currencyUAH.name = "UAH"
        currencyUAH.value = "25.84"
    }
    
    override func tearDown() {
        super.tearDown()
        productEggs = ProductModel()
        productMilk = ProductModel()
        products = [ProductModel]()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTotalPriceAndQuantity() {
        //calc total price and quantity
        //print("productListViewController: ",productListViewController.updateHeader())
        let calculateTotalQuantityAndprice = ProductModel.getTotalPriceinUSD(products: products)
        
        //Since we have only 2 products we should have:
        //Milk - quantity: 10 - price: 1.30 - total price: 13.0
        //Eggs - quantity: 6  - price: 2.10 - total price: 12.6
        //Total: quantity: 16 -             - total price: 25.6
        
        XCTAssertTrue(calculateTotalQuantityAndprice.totalQuantity == 16, "Quantity Not OK \(calculateTotalQuantityAndprice.totalQuantity)")
        XCTAssertTrue(calculateTotalQuantityAndprice.totalPrice == 25.6, "Price Not OK \(calculateTotalQuantityAndprice.totalPrice)")
        
        //Total Price and Quantity passed the test!
        //Let's make cal for USD -> CHF at rate 1:09.7
        // total price in USD = 25.6
        // total price in CHF = 24.832
        // total price in EUR = 21.76
        // total price in UAH = 661.504
        
        let totalPriceInUSD = calculateTotalQuantityAndprice.totalPrice
        let totalPriceInCHF = CurrencyModel.updatePriceForNewCurrency(oldPriceStr: "\(totalPriceInUSD)", currency: currencyCHF)
        let totalPriceInEUR = CurrencyModel.updatePriceForNewCurrency(oldPriceStr: "\(totalPriceInUSD)", currency: currencyEUR)
        let totalPriceInUAH = CurrencyModel.updatePriceForNewCurrency(oldPriceStr: "\(totalPriceInUSD)", currency: currencyUAH)
        
        XCTAssertTrue(totalPriceInCHF == 24.832, "Total Price in new currency is Not OK \(totalPriceInCHF)")
        XCTAssertTrue(totalPriceInEUR == 21.76, "Total Price in new currency is Not OK \(totalPriceInEUR)")
        XCTAssertTrue(totalPriceInUAH == 661.504, "Total Price in new currency is Not OK \(totalPriceInUAH)")
        
        
    }
    
    func testFullBasketFlow() {
        //Basket Flow:
        // 1 - init
        // 2 - adding product (it means, add quantity. It should be greater than ZERO)
        // 3 - calculate Total Price
        // 4 - calculate total Price in different currency
    }
    
}
