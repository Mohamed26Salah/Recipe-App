//
//  FavouritesVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import RxDataSources

class FavouritesVC: BasicVC {

    @IBOutlet weak var savedItemsTableVIew: UITableView!
    let recipeVC = FavouritesVC.recipeVC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        savedItemsTableVIew.register(UINib(nibName: K.cellsResuable.FoodTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.FoodTVC)
        bindTableView()
        recipeSelected()
    }
}
extension FavouritesVC {
    func bindTableView() {
        let dataSource = RxTableViewSectionedAnimatedDataSource<LocalRecipeSectionModel>(
            configureCell: { [weak self]  dataSource, tableView, indexPath, recipe in
                guard let self = self else {
                    return UITableViewCell()
                }
                let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsResuable.FoodTVC, for: indexPath) as! FoodTVC
                cell.nameLabel.text = recipe.name
                let ratingMap = recipeVC.mapValue(fromRange: 0.0...1.0, toRange: 1.0...10.0, value: recipe.userRatings.score)
                cell.ratingLabel.text = String(format: "%.1f", ratingMap)
                cell.ratingBackgroundView.backgroundColor = recipeVC.ratingColor(rating: ratingMap)
                if let url = URL(string: recipe.thumbnailURL) {
                    cell.recipeImage.sd_setImage(with: url)
                }
                cell.timeNeededLabel.text = recipeVC.returnTimeTier(timeTier: recipe.totalTimeTier?.displayTier ?? .under30Minutes)
                cell.firstIngredientLabel.text = recipe.tags[0].name
                cell.secoundIngredientLabel.text = recipe.tags[1].name
                cell.thirdIngredientLabel.text = recipe.tags[2].name
                cell.saveButton.isChecked = RecipeDataManager.shared().isRecipeFavorited(id: Int32(recipe.id))
                cell.onFavButtonTapped = {
                    if cell.saveButton.isChecked {
                        RecipeDataManager.shared().createRecipe(recipe: recipe)
                    } else {
                        RecipeDataManager.shared().deleteRecipe(recipe: recipe)
                    }
                    self.recipeVC.localRecipesList.accept(RecipeDataManager.shared().getAllRecipes())
                    if let recipeModel = self.recipeVC.recipesModel {
                        self.recipeVC.recipesList.accept(recipeModel.results)
                    }
                }
                return cell
            }
        )
        recipeVC.localRecipesList
            .map { recipes in
                [LocalRecipeSectionModel(model: "", items: recipes)]
            }
            .bind(to: savedItemsTableVIew.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    func recipeSelected() {
        savedItemsTableVIew
            .rx.modelSelected(RecipeObject.self)
            .subscribe { [weak self] recipeObject in
                guard let self = self else { return }
                self.savedItemsTableVIew.deselectRow(at: self.savedItemsTableVIew.indexPathForSelectedRow!, animated: true)
                let foodVC = self.storyboard?.instantiateViewController(identifier: K.ViewsControllers.FoodDetailsVC) as! FoodDetailsVC
                foodVC.recipeDetails = recipeObject
                foodVC.recipeVC = recipeVC
                self.navigationController?.pushViewController(foodVC, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
extension FavouritesVC {
    func setupUI() {
        savedItemsTableVIew.backgroundColor = .clear
    }
}
