////
////  HomeVC.swift
////  Recipe-App
////
////  Created by Mohamed Salah on 09/09/2023.
////
//
//import UIKit
//import RxSwift
//import RxCocoa
//import SDWebImage
//class HomeVC: BasicVC {
//
//    @IBOutlet weak var searchBar: UISearchBar!
//    @IBOutlet weak var foodTableView: UITableView!
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    
////    let disposeBag = DisposeBag()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        foodTableView.register(UINib(nibName: K.cellsResuable.FoodTVC, bundle: nil), forCellReuseIdentifier: K.cellsResuable.FoodTVC)
//        showRecipesData()
//        handleLoadingIndicator()
//        search()
//        recipeSelected()
//    }
//    
//    @IBAction func timeFilterButtonsPressed(_ sender: UIButton) {
//        switch sender.tag {
//        case 0:
//            recipeVC.getRecipes(tag: "under_15_minutes")
//            recipeVC.recipesList.accept([RecipesList]())
//            break
//        case 1:
//            recipeVC.getRecipes(tag: "under_30_minutes")
//            recipeVC.recipesList.accept([RecipesList]())
//            break
//        case 2:
//            recipeVC.getRecipes(tag: "under_45_minutes")
//            recipeVC.recipesList.accept([RecipesList]())
//            break
//        default:
//            recipeVC.getRecipes()
//        }
//    }
//}
//extension HomeVC {
//    func showRecipesData() {
//        recipeVC.recipesList
//            .bind(to: foodTableView
//                .rx
//                .items(cellIdentifier: K.cellsResuable.FoodTVC, cellType: FoodTVC.self)) { [weak self] (tv, recipe, cell) in
//                    guard let self = self else {
//                        return
//                    }
//                    cell.nameLabel.text = recipe.name
//                    let ratingMap = recipeVC.mapValue(fromRange: 0.0...1.0, toRange: 1.0...10.0, value: recipe.userRatings.score)
//                    cell.ratingLabel.text = String(format: "%.1f", ratingMap)
//                    cell.ratingBackgroundView.backgroundColor = recipeVC.ratingColor(rating: ratingMap)
//                    if let url = URL(string: recipe.thumbnailURL) {
//                        cell.recipeImage.sd_setImage(with: url)
//                    }
//                    cell.timeNeededLabel.text = recipeVC.returnTimeTier(timeTier: recipe.totalTimeTier?.displayTier ?? .under30Minutes)
//                    cell.firstIngredientLabel.text = recipe.tags[0].name
//                    cell.secoundIngredientLabel.text = recipe.tags[1].name
//                    cell.thirdIngredientLabel.text = recipe.tags[2].name
//                }
//                .disposed(by: disposeBag)
//        recipeVC.recipesList
//            .map { $0.isEmpty }
//            .subscribe(onNext: { [weak self] isEmpty in
//                self?.updateTableViewUI(isEmpty: isEmpty)
//            })
//            .disposed(by: disposeBag)
//    }
//    func search() {
//        searchBar.rx.text.orEmpty
//            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
//            .subscribe(onNext: { [weak self] query in
//                guard let self = self else { return }
//                let filteredRecipes = self.recipeVC.recipesModel?.results.filter({ recipe in
//                    query.isEmpty || recipe.name.lowercased().contains(query.lowercased())
//                })
//                self.recipeVC.recipesList.accept(filteredRecipes ?? [])
//            })
//            .disposed(by: disposeBag)
//    }
//    func recipeSelected() {
//        foodTableView
//            .rx.modelSelected(RecipesList.self)
//            .subscribe { [weak self] recipeObject in
//                guard let self = self else { return }
//                self.foodTableView.deselectRow(at: self.foodTableView.indexPathForSelectedRow!, animated: true)
//                let foodVc = self.storyboard?.instantiateViewController(identifier: K.ViewsControllers.FoodDetailsVC) as! FoodDetailsVC
//                foodVc.recipeDetails = recipeObject
//                self.navigationController?.pushViewController(foodVc, animated: true)
//            }
//            .disposed(by: disposeBag)
//    }
//
//}
//extension HomeVC {
//    func setupUI() {
//        foodTableView.backgroundColor = .clear
//    }
//    func updateTableViewUI(isEmpty: Bool) {
//        if isEmpty {
//            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: foodTableView.bounds.size.width, height: foodTableView.bounds.size.height))
//            noDataLabel.text = "Their is nothing here!"
//            noDataLabel.textColor = UIColor.black
//            noDataLabel.textAlignment = .center
//            foodTableView.backgroundView = noDataLabel
//            foodTableView.separatorStyle = .none
//        } else {
//            foodTableView.backgroundView = nil
//            foodTableView.separatorStyle = .singleLine
//        }
//    }
//    func handleLoadingIndicator() {
//        recipeVC.showLoading
//            .observe(on: MainScheduler.instance)
//            .subscribe(onNext: { [weak self] isLoading in
//                if isLoading {
//                    self?.activityIndicator.startAnimating()
//                } else {
//                    self?.activityIndicator.stopAnimating()
//                }
//            })
//            .disposed(by: disposeBag)
//    }
//    
//}
//invalidJSON(Swift.DecodingError.dataCorrupted(Swift.DecodingError.Context(codingPath: [CodingKeys(stringValue: "results", intValue: nil), _JSONKey(stringValue: "Index 17", intValue: 17), CodingKeys(stringValue: "compilations", intValue: nil), _JSONKey(stringValue: "Index 1", intValue: 1), CodingKeys(stringValue: "promotion", intValue: nil)], debugDescription: "Cannot initialize Promotion from invalid String value none", underlyingError: nil)))
