//
//  MainVC.swift
//  Kitchen
//
//  Created by Daniel Parra on 10/24/20.
//

import UIKit
import Kingfisher

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UISearchBar!

    var meals: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.becomeFirstResponder()
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealTVCell") as? MealTVCell else {
            return UITableViewCell()
        }
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.categoryLabel.text = meal.category
        cell.mealImage.kf.setImage(with: URL(string: meal.thumb))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        vc.meal = meals[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainVC: UITableViewDelegate {}

extension MainVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APIService.shared.searchFor(query: searchText) { meals in
            self.meals = meals.meals
            self.tableView.reloadData()            
        }
    }
}
