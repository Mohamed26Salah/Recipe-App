//
//  RecipeViewModel.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 10/09/2023.
//

import RxSwift
import RxCocoa
import RxRelay
import UIKit

class RecipeViewModel {
    let apiManager: APIClientProtocol
    init( apiManager: APIClientProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    private let disposeBag = DisposeBag()
    var recipesModel: Recipes?
    //out
    var recipesList = PublishRelay<[RecipesList]>.init()
    var showLoading = BehaviorRelay<Bool>(value: false)
    var errorSubject = PublishSubject<Error>()

    func getRecipes(tag: String = "under_30_minutes") {
        let headers = [
            "X-RapidAPI-Key": "24bfbf74f8mshd70a51277440043p144846jsn5651052b0f4b",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        let queryParamters = [
            "from": "0",
            "size": "20",
            "tags": tag
        ]
        self.showLoading.accept(true)
        apiManager.fetchGlobal(parsingType: Recipes.self, baseURL: APIManager.EndPoint.recipeList.stringToUrl, queryParameters: queryParamters, headers: headers)
            .subscribe(
                onNext: { recipes in
                    self.recipesModel = recipes
                    self.recipesList.accept(recipes.results)
                    self.showLoading.accept(false)
                },
                onError: { error in
                    self.showLoading.accept(false)
                    self.errorSubject.onNext(error)
                }
            )
            .disposed(by: disposeBag)
    }
}
extension RecipeViewModel {
    func extractNames(from inputString: String) -> [String] {
        let nameArray = inputString.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        return nameArray
    }
    func mapValue(fromRange: ClosedRange<Double>, toRange: ClosedRange<Double>, value: Double) -> Double {
        let normalizedValue = (value - fromRange.lowerBound) / (fromRange.upperBound - fromRange.lowerBound)
        let mappedValue = toRange.lowerBound + normalizedValue * (toRange.upperBound - toRange.lowerBound)
        return mappedValue
    }
    func ratingColor(rating: Double) -> UIColor {
        switch rating {
        case 0.0..<5.0:
            return .red
        case 5.0..<8.0:
            return .yellow
        case 8.0...10.0:
            return .green
        default:
            // Handle any other cases (optional)
            return .black
        }
    }
}
