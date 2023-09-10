//
//  BasicVC.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import UIKit
import RxSwift
import RxCocoa

class BasicVC: UIViewController {
    let recipeVC = RecipeViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseUI()
        recipeVC.getRecipes()
        handleErrors()
    }
}
extension BasicVC {
    func setupBaseUI() {
        let imageView = UIImageView(image: UIImage(named: K.ImageAssets.YummyImage))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        navigationItem.titleView = imageView
    }
    func handleErrors() {
        recipeVC.errorSubject
            .subscribe { error in
                self.show(messageAlert: "Error", message: error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
}
