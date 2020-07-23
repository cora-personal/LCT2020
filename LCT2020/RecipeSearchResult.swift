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
    var recipeName = ""
    var recipeLink = ""
    var ingredients: String? = ""
    var thumbnail = ""
   
    enum CodingKeys: String, CodingKey {
        case recipeName = "title"
        case recipeLink = "href"
        case ingredients, thumbnail
    }
    
    var description: String {
        return "Name: \(recipeName), Link: \(recipeLink), Ingredients: \(ingredients ?? "None")"
    }
}

func < (lhs: RecipeSearchResult, rhs: RecipeSearchResult) -> Bool {
    return lhs.recipeName.localizedStandardCompare(rhs.recipeName) == .orderedAscending
}


