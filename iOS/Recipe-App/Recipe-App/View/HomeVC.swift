//
//  HomeVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit

class HomeVC: BasicVC {

    @IBOutlet weak var foodTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        foodTableView.register(UINib(nibName: K.cellsResuable.FoodTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.FoodTVC)

    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.FoodTVC, for: indexPath) as! FoodTVC
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodDetails = FoodDetailsVC()
        foodDetails.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(foodDetails, animated: true)
//        self.foodTableView.deselectRow(at: self.foodTableView.indexPathForSelectedRow!, animated: true)
    }

}
extension HomeVC {
    func setupUI() {
        foodTableView.backgroundColor = .clear
    }
}
