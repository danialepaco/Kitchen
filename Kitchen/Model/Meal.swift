//
//  Meal.swift
//  Kitchen
//
//  Created by Daniel Parra on 10/24/20.
//

import Foundation

struct Meals: Decodable {
    var meals: [Meal]
}

struct Meal: Decodable {
    let id: String
    let thumb: String
    let name: String
    let category: String
    let instructions: String
    let video: String
    var ingredients: [String] = []

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case thumb = "strMealThumb"
        case name = "strMeal"
        case category = "strCategory"
        case instructions = "strInstructions"
        case video = "strYoutube"
    }
}
