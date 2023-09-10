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
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.register(UINib(nibName: K.cellsResuable.NutritionTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.NutritionTVC)
        // Do any additional setup after loading the view.
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
