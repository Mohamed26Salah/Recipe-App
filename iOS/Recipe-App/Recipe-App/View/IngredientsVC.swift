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
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsTableView.register(UINib(nibName: K.cellsResuable.IngredientsTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.IngredientsTVC)

    }


}
extension IngredientsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.IngredientsTVC, for: indexPath) as! IngredientsTVC
        cell.selectionStyle = .none
        return cell
    }
    
    
}
