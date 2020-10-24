//
//  DetailVC.swift
//  Kitchen
//
//  Created by Daniel Parra on 10/24/20.
//

import UIKit

class DetailVC: UIViewController {
    
    var meal: Meal?
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = meal?.name
        mealImage.kf.setImage(with: URL(string: meal?.thumb ?? ""))
        instructionsLabel.text = meal?.instructions
        
        let ingredients = meal?.ingredients ?? []
        var list = ""
        for (index, ingredient) in ingredients.enumerated() {
            list = list + "\(index+1). \(ingredient)\n"
            ingredientsLabel.text = "Ingredients:\n\n\(list)"
        }
    }
}
