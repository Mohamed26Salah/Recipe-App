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
    var recipeDetails: RecipesList!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.register(UINib(nibName: K.cellsResuable.NutritionTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.NutritionTVC)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRecipeDetails(_:)), name: NSNotification.Name("RecipeDetailsNotification"), object: nil)

    }
    @objc func handleRecipeDetails(_ notification: Notification) {
        if let recipe = notification.object as? RecipesList {
            recipeDetails = recipe
        }
    }
}
extension DetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.NutritionTVC, for: indexPath) as! NutritionTVC
        return cell
    }
    
    
}
