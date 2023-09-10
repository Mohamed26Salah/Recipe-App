//
//  HomeVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage
class HomeVC: BasicVC {

    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        foodTableView.register(UINib(nibName: K.cellsResuable.FoodTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.FoodTVC)
        showRecipesData()
        handleLoadingIndicator()
    }
}
extension HomeVC {
    func showRecipesData() {
        recipeVC.recipesList
            .bind(to: foodTableView
                .rx
                .items(cellIdentifier: K.cellsResuable.FoodTVC, cellType: FoodTVC.self)) { [weak self] (tv, recipe, cell) in
                    guard let self = self else {
                        return
                    }
                    cell.nameLabel.text = recipe.name
                    let ratingMap = recipeVC.mapValue(fromRange: 0.0...1.0, toRange: 1.0...10.0, value: recipe.userRatings.score)
                    cell.ratingLabel.text = String(format: "%.1f", ratingMap)
                    cell.ratingBackgroundView.backgroundColor = recipeVC.ratingColor(rating: ratingMap)
                    if let url = URL(string: recipe.thumbnailURL) {
                        cell.recipeImage.sd_setImage(with: url)
                    }
                    cell.firstIngredientLabel.text = recipe.tags[0].name
                    cell.secoundIngredientLabel.text = recipe.tags[1].name
                    cell.thirdIngredientLabel.text = recipe.tags[2].name
                }
                .disposed(by: disposeBag)
//        recipeVC.recipesList
//            .map { $0.isEmpty }
//            .subscribe(onNext: { [weak self] isEmpty in
//                self?.updateTableViewUI(isEmpty: isEmpty)
//            })
//            .disposed(by: disposeBag)
    }
}
extension HomeVC {
    func setupUI() {
        foodTableView.backgroundColor = .clear
    }
    func updateTableViewUI(isEmpty: Bool) {
        if isEmpty {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: foodTableView.bounds.size.width, height: foodTableView.bounds.size.height))
            noDataLabel.text = "We are trying to fetch the data!"
            noDataLabel.textColor = UIColor.black
            noDataLabel.textAlignment = .center
            foodTableView.backgroundView = noDataLabel
            foodTableView.separatorStyle = .none
        } else {
            foodTableView.backgroundView = nil
            foodTableView.separatorStyle = .singleLine
        }
    }
    func handleLoadingIndicator() {
        recipeVC.showLoading
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            })
            .disposed(by: disposeBag)
    }
    
}
