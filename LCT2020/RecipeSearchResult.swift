//
//  RecipeSearchResult.swift
//  LCT2020
//
//  Created by My Apps on 15/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import Foundation

class ResultArray:Codable {
    var title = ""
    var version = 0.0
    var href = ""
    var results = [RecipeSearchResult]()
}
class RecipeSearchResult:Codable, CustomStringConvertible {
    var title: String? = ""
    //var href: String? = ""
   var ingredients: String? = ""
  //  var thumbnail: String? = ""
    
   
    //var name:String {
    //    return  title ?? ""
    //}
    
    var description: String {
        return "Name: \(title ?? "None"), Ingredients: \(ingredients ?? "None")"
    }
}

