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
import RxDataSources


class HomeVC: BasicVC {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let recipeVC = HomeVC.recipeVC
    //    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        foodTableView.register(UINib(nibName: K.cellsResuable.FoodTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.FoodTVC)
        //        showRecipesData()
        handleLoadingIndicator()
        search()
        recipeSelected()
        bindTableView()
    }
    
    @IBAction func timeFilterButtonsPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            recipeVC.getRecipes(tag: "under_15_minutes")
            //Empty the Array for animation
            recipeVC.recipesList.accept([RecipeObject]())
            break
        case 1:
            recipeVC.getRecipes(tag: "under_30_minutes")
            recipeVC.recipesList.accept([RecipeObject]())
            break
        case 2:
            recipeVC.getRecipes(tag: "under_45_minutes")
            recipeVC.recipesList.accept([RecipeObject]())
            break
        default:
            recipeVC.getRecipes()
        }
    }
}
extension HomeVC {
    func bindTableView() {
        let dataSource = RxTableViewSectionedAnimatedDataSource<RecipeSectionModel>(
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
                }
                return cell
            }
        )
        //Using RxDataSources, instead of passing an array of items to the table or collection view, you pass an array of section models. The section model defines both what goes in the section header (if any), and the data model of each item of that section.
        // DataSource Expects an array of sections, each section carry it items
        // here I just have an array with one section and no title.
        recipeVC.recipesList
            .map { recipes in
                [RecipeSectionModel(model: "", items: recipes)]
            }
            .bind(to: foodTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    
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
                    cell.timeNeededLabel.text = recipeVC.returnTimeTier(timeTier: recipe.totalTimeTier?.displayTier ?? .under30Minutes)
                    cell.firstIngredientLabel.text = recipe.tags[0].name
                    cell.secoundIngredientLabel.text = recipe.tags[1].name
                    cell.thirdIngredientLabel.text = recipe.tags[2].name
                    cell.onFavButtonTapped = {
                        print("Tappped")
                    }
                }
                .disposed(by: disposeBag)
        recipeVC.recipesList
            .map { $0.isEmpty }
            .subscribe(onNext: { [weak self] isEmpty in
                self?.updateTableViewUI(isEmpty: isEmpty)
            })
            .disposed(by: disposeBag)
    }
    func search() {
        searchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] query in
                guard let self = self else { return }
                let filteredRecipes = self.recipeVC.recipesModel?.results.filter({ recipe in
                    query.isEmpty || recipe.name.lowercased().contains(query.lowercased())
                })
                self.recipeVC.recipesList.accept(filteredRecipes ?? [])
            })
            .disposed(by: disposeBag)
    }
    func recipeSelected() {
        foodTableView
            .rx.modelSelected(RecipeObject.self)
            .subscribe { [weak self] recipeObject in
                guard let self = self else { return }
                self.foodTableView.deselectRow(at: self.foodTableView.indexPathForSelectedRow!, animated: true)
                let foodVC = self.storyboard?.instantiateViewController(identifier: K.ViewsControllers.FoodDetailsVC) as! FoodDetailsVC
                foodVC.recipeDetails = recipeObject
                foodVC.recipeVC = recipeVC
                self.navigationController?.pushViewController(foodVC, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
}
extension HomeVC {
    func setupUI() {
        foodTableView.backgroundColor = .clear
    }
    func updateTableViewUI(isEmpty: Bool) {
        if isEmpty {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: foodTableView.bounds.size.width, height: foodTableView.bounds.size.height))
            noDataLabel.text = "Their is nothing here!"
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
