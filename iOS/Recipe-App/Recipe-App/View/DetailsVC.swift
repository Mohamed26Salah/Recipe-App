//
//  DetailsVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 10/09/2023.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var detailsTableView: UITableView!
    var recipeDetails: RecipeObject!
    var nutritionArray = [[String:Int?]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.register(UINib(nibName: K.cellsResuable.NutritionTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.NutritionTVC)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRecipeDetails(_:)), name: NSNotification.Name("RecipeDetailsNotification"), object: nil)

    }
    @objc func handleRecipeDetails(_ notification: Notification) {
        if let recipe = notification.object as? RecipeObject {
            recipeDetails = recipe
            fillUIData()
            detailsTableView.reloadData()
            nutritionArray = fillNutritionArray()
        }
    }
}
extension DetailsVC {
    func fillUIData() {
        recipeNameLabel.text = recipeDetails.name
        creditsLabel.text = getCredits()
        countryLabel.text = recipeDetails.country?.rawValue
        lastUpdatedLabel.text = String(recipeDetails.updatedAt.formattedDate())
        recipeDescriptionLabel.text = recipeDetails.description
    }
    func getCredits() -> String {
        var credits = ""
        
        for credit in recipeDetails.credits {
            if let name = credit.name {
                credits += name + ", "
            }
        }
        if credits.hasSuffix(", ") {
            credits.removeLast(2)
        }
        
        return credits
    }
    func fillNutritionArray() -> [[String: Int?]] {
        let nutritionArray: [[String: Int?]] = [
            ["Fat": recipeDetails.nutrition.fat],
            ["Fiber": recipeDetails.nutrition.fiber],
            ["Protein": recipeDetails.nutrition.protein],
            ["Sugar": recipeDetails.nutrition.sugar],
            ["Calories": recipeDetails.nutrition.calories],
            ["Carbohydrates": recipeDetails.nutrition.carbohydrates]
        ]
        return nutritionArray
    }

}
extension DetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nutritionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.NutritionTVC, for: indexPath) as! NutritionTVC
        let nutritionItem = nutritionArray[indexPath.row]
        if let itemName = nutritionItem.keys.first, let itemValue = nutritionItem.values.first {
            cell.nutritionNameLabel.text = itemName
            if let value = itemValue {
                cell.nutritionQuantityLabel.text = "\(value) g"
            } else {
                cell.nutritionQuantityLabel.text = "N/A"
            }
        }
        return cell
    }
    
    
}
