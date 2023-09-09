//
//  FavouritesVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit

class FavouritesVC: BasicVC {

    @IBOutlet weak var savedItemsTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        savedItemsTableVIew.register(UINib(nibName: K.cellsResuable.FoodTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.FoodTVC)

    }
}
extension FavouritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.FoodTVC, for: indexPath) as! FoodTVC
        
        return cell
    }

}
extension FavouritesVC {
    func setupUI() {
       
    }
}
