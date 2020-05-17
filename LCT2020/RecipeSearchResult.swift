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
    //do I/why give default values?
    //var title: String? = ""
    var recipeName = "" //dont think its an optional
    var recipeLink: String? = ""
    var ingredients: String? = ""
    var thumbnail = ""
   
    //var name:String {
    //    return  title ?? ""
    //}
    
    enum CodingKeys: String, CodingKey {
        case recipeName = "title"
        case recipeLink = "href"
        case ingredients, thumbnail
    }
    
    
    var description: String {
        return "Name: \(recipeName), Link: \(recipeLink ?? "None"), Ingredients: \(ingredients ?? "None")"
        //return "Name: \(title ?? "None"), Link: \(href ?? "None"), Ingredients: \(ingredients ?? "None")"
    }
}

func < (lhs: RecipeSearchResult, rhs: RecipeSearchResult) -> Bool {
    return lhs.recipeName.localizedStandardCompare(rhs.recipeName) == .orderedAscending
}


