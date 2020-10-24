//
//  APIService.swift
//  Kitchen
//
//  Created by Daniel Parra on 10/24/20.
//

import Alamofire

class APIService {
    
    static let shared = APIService()
    
    private let base = "https://www.themealdb.com/api/json/v1/1/"
    private let search = "search.php?s="
    
    func searchFor(query: String, completion: @escaping (Meals) -> Void) {
        AF.request("\(base)\(search)\(query)", method: .get).responseJSON { response in
            guard let data = response.data else { return}
            let jsonDecoder = JSONDecoder()
            let meals = try! jsonDecoder.decode(Meals.self, from: data)
            completion(meals)
        }
    }
}
