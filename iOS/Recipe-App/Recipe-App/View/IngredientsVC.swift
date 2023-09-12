//
//  IngredientsVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 10/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class IngredientsVC: UIViewController {
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var timeForRecipeLabel: UILabel!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var instructionsTableView: UITableView!
    var recipeDetails: RecipeObject!
    var stepColorPattern = true
    //    var recipeDetails = PublishRelay<RecipesList>.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsTableView.register(UINib(nibName: K.cellsResuable.IngredientsTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.IngredientsTVC)
        instructionsTableView.register(UINib(nibName: K.cellsResuable.InstructionTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.InstructionTVC)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRecipeDetails(_:)), name: NSNotification.Name("RecipeDetailsNotification"), object: nil)
        
    }
    @objc func handleRecipeDetails(_ notification: Notification) {
        if let recipe = notification.object as? RecipeObject {
            recipeDetails = recipe
            fillUIData()
            ingredientsTableView.reloadData()
            instructionsTableView.reloadData()
        }
    }
    
}
extension IngredientsVC {
    func fillUIData() {
        numberOfItemsLabel.text = String(recipeDetails.sections[0].components.count) + " items"
        timeForRecipeLabel.text = recipeDetails.totalTimeTier?.displayTier?.rawValue ?? "Under 30 minutes"
    }
}
extension IngredientsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ingredientsTableView {
            return recipeDetails.sections[0].components.count
        } else if tableView == instructionsTableView {
            return recipeDetails.instructions.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ingredientsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.IngredientsTVC, for: indexPath) as! IngredientsTVC
            cell.ingredientLabel.text = recipeDetails.sections[0].components[indexPath.row].rawText
            return cell
        } else if tableView == instructionsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.InstructionTVC, for: indexPath) as! InstructionTVC
            cell.currentStepLabel.text = "Step " + String(indexPath.row + 1)
            if stepColorPattern {
                cell.currentStepLabel.textColor = UIColor(red: 273.0/255.0, green: 106.0/255.0, blue: 50.0/255.0, alpha: 1.0)
            }
            cell.instructionLabel.text = recipeDetails.instructions[indexPath.row].displayText
            stepColorPattern.toggle()
            return cell
        }
        return UITableViewCell()
    }
    
    
}

