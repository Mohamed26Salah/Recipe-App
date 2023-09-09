//
//  FoodTVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit

class FoodTVC: UITableViewCell {

    @IBOutlet weak var saveButton: RadioButton!
    @IBOutlet weak var timeNeededLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var firstIngredientLabel: UILabel!
    @IBOutlet weak var secoundIngredientLabel: UILabel!
    @IBOutlet weak var thirdIngredientLabel: UILabel!
    var onFavButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func saveButtonTapped(_ sender: RadioButton) {
        onFavButtonTapped?()
    }
}
