//
//  APIService.swift
//  Kitchen
//
//  Created by Daniel Parra on 10/24/20.
//

import Alamofire
import SwiftyJSON

class APIService {
    
    static let shared = APIService()
    
    private let base = "https://www.themealdb.com/api/json/v1/1/"
    private let search = "search.php?s="
    
    func searchFor(query: String, completion: @escaping (Meals) -> Void) {
        AF.request("\(base)\(search)\(query)", method: .get).responseJSON { response in
            guard let data = response.data else { return}
            let jsonDecoder = JSONDecoder()
            
            var meals = try! jsonDecoder.decode(Meals.self, from: data)
            let json = try! JSON(data: data)
            for (index, meal) in json["meals"].arrayValue.enumerated() {
                var ingredients: [String] = []
                for index in 1...20 {
                    if let ingredient = meal["strIngredient\(index)"].string, !ingredient.isEmpty {
                        ingredients.append(ingredient)
                    }
                }
                meals.meals[index].ingredients = ingredients
            }
            completion(meals)
        }
    }
}
