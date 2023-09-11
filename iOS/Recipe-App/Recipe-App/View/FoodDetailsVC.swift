//
//  FoodDetailsVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit
import CoreGraphics

class FoodDetailsVC: UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeGradientView: UIView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var watchTheVideoButton: UIButton!
    @IBOutlet weak var ingredientsButton: UIButton!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var ingredientsView: UIView!
    @IBOutlet weak var detailsView: UIView!
    var recipeDetails: RecipesList!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        ingredientsView.isHidden = false
        detailsView.isHidden = true
    }

    @IBAction func watchTheVideoButtonTapped(_ sender: UIButton) {
    }

    @IBAction func ingrediantesDetailsButtonTapped(_ sender: UIButton) {
        let animationDuration: TimeInterval = 0.5

        UIView.transition(with: ingredientsView, duration: animationDuration, options: .transitionCrossDissolve, animations: {
            self.ingredientsView.isHidden = sender.tag == 2
        }, completion: nil)

        UIView.transition(with: detailsView, duration: animationDuration, options: .transitionCrossDissolve, animations: {
            self.detailsView.isHidden = sender.tag == 1
        }, completion: nil)
    }


}
extension FoodDetailsVC {
    func setupUI() {
        applyCustomNavigationColor()
        recipeGradientView.backgroundColor = UIColor(red: 1.0, green: 0.24, blue: 0.0, alpha: 0.4)
        
        watchTheVideoButton.backgroundColor = UIColor.white
        watchTheVideoButton.layer.cornerRadius = 15
    }
    func applyCustomNavigationColor() {
        let customColor = UIColor(red: 273.0/255.0, green: 106.0/255.0, blue: 50.0/255.0, alpha: 1.0)

        navigationController?.navigationBar.tintColor = customColor
    }
}
