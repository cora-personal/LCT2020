//
//  SessionResult.swift
//  LCT2020
//
//  Created by My Apps on 24/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

//import Foundation
//import UIKit
//import SwiftSoup
//
//enum HTMLError: Error {
//    case incorrectHTML
//}
//
//struct SessionResponse {
//    
//    let sessionResults: [SessionSearchResult]
//    
//    init(_ innerHTML: Any?) throws {
//        guard let htmlString = innerHTML as? String else { throw HTMLError.incorrectHTML }
//        let doc = try SwiftSoup.parse(htmlString)
//        let sessionNames = try doc.getElementsByClass("description").array()
//        let addresses = try doc.getElementsByClass("address").array()
//        let dates = try doc.getElementsByClass("date").array()
//        let times = try doc.getElementsByClass("time").array()
//        let prices = try doc.getElementsByClass("price").array()
//        
//        var sessionResults = [SessionSearchResult]()
//        for i in 0..<sessionNames.count {
//            let sessionName = try sessionNames[i].text()
//            let address = try addresses[i].text()
//            let date = try dates[i].text()
//            let time = try times[i].text()
//            let price = try prices[i].text()
//            
//            
//            print(sessionName)
//            print(address)
//            print(date)
//            print(time)
//            print(price)
//            print("")
//            let sessionResult = SessionSearchResult(sessionName: sessionName, time: time, date: date, price: price, address: address)
//            sessionResults.append(sessionResult)
//        }
//        self.sessionResults = sessionResults
//    }
//    
//    //"result style-1 clearfix"
//        //description
//        //address
//        //details
//        
//        
////        var sessionName = "" //dont think its an optional
////        var time = ""
////        var date = ""
////        var price = ""
////        var address = ""
//        
//        
//        //}
//        
//}
