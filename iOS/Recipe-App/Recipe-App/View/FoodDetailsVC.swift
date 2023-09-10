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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        ingredientsView.superview?.bringSubviewToFront(ingredientsView)
    }

    @IBAction func watchTheVideoButtonTapped(_ sender: UIButton) {
    }

    @IBAction func ingrediantesDetailsButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            ingredientsView.isHidden = false
            detailsView.isHidden = true
        case 2:
            detailsView.isHidden = false
            ingredientsView.isHidden = true
        default:
            break
        }
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
