//
//  IngredientsVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 10/09/2023.
//

import UIKit

class IngredientsVC: UIViewController {
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var instructionsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsTableView.register(UINib(nibName: K.cellsResuable.IngredientsTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.IngredientsTVC)
        instructionsTableView.register(UINib(nibName: K.cellsResuable.InstructionTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.InstructionTVC)
        
    }
    
    
}
extension IngredientsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ingredientsTableView {
            return 9
        } else if tableView == instructionsTableView {
            return 5
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ingredientsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.IngredientsTVC, for: indexPath) as! IngredientsTVC
            return cell
        } else if tableView == instructionsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.InstructionTVC, for: indexPath)
            as! InstructionTVC
            return cell
        }
        return UITableViewCell()
    }
    
    
}

