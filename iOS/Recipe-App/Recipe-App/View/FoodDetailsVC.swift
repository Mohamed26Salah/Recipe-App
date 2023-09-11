//
//  FoodDetailsVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit
import CoreGraphics
import SDWebImage
import AVKit

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
    var recipeVC: RecipeViewModel!
//    let recipeVC = RecipeViewModel()
    var recipeVideoQualityList: [VideoQualityOption]!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fillUIData()
        ingredientsView.isHidden = false
        detailsView.isHidden = true
        sendRecipeObjectToViews()
        recipeVideoQualityList = recipeVC.videoQualityArray(recipe: recipeDetails)
        
    }
    
    @IBAction func watchTheVideoButtonTapped(_ sender: UIButton) {
        showQualitySelectionMenu()
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
    func fillUIData() {
        if let url = URL(string: recipeDetails.thumbnailURL) {
            recipeImage.sd_setImage(with: url)
        }
        recipeNameLabel.text = recipeDetails.name
    }

}
extension FoodDetailsVC {
    func sendRecipeObjectToViews() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: NSNotification.Name("RecipeDetailsNotification"), object: recipeDetails)
    }
    func showQualitySelectionMenu() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self

        let alertController = UIAlertController(title: "Select Video Quality", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        let playAction = UIAlertAction(title: "Play", style: .default) { [weak self] _ in
            guard let self = self else { return }
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            let selectedQuality = self.recipeVideoQualityList[selectedRow]
            self.playVideo(with: selectedQuality)
        }

        alertController.addAction(cancelAction)
        alertController.addAction(playAction)

        alertController.view.addSubview(pickerView)

        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: alertController.view.centerXAnchor).isActive = true
        pickerView.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 20).isActive = true

        present(alertController, animated: true, completion: nil)
    }

    func playVideo(with qualityOption: VideoQualityOption) {
        let player = AVPlayer(url: qualityOption.videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player

        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
}
extension FoodDetailsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return recipeVideoQualityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return recipeVideoQualityList[row].qualityLabel
    }
}
