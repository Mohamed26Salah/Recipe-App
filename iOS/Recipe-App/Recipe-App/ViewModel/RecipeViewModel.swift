//
//  RecipeViewModel.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 10/09/2023.
//

import RxSwift
import RxCocoa
import RxRelay
import RxDataSources
import UIKit

typealias RecipeSectionModel = AnimatableSectionModel<String, RecipeObject>
typealias LocalRecipeSectionModel = AnimatableSectionModel<String, RecipeObject>

class RecipeViewModel {
    let apiManager: APIClientProtocol
    init( apiManager: APIClientProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    private let disposeBag = DisposeBag()
    var recipesModel: Recipes?
    //out
    var recipesList = PublishRelay<[RecipeObject]>.init()
    var localRecipesList = BehaviorRelay<[RecipeObject]>(value: RecipeDataManager.shared().getAllRecipes())
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
                    print(error)
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
    func returnTimeTier(timeTier: DisplayTier) -> String {
        switch timeTier {
        case .under15Minutes:
            return "15min"
        case .under30Minutes:
            return "30min"
        case .under45Minutes:
            return "45min"
        }
    }
    private func sortVideoQualityArrayByWidth(videoQualityArray: [VideoQualityOption]) -> [VideoQualityOption] {
        let sortedArray = videoQualityArray.sorted {
            if let width1 = Int($0.qualityLabel), let width2 = Int($1.qualityLabel) {
                return width1 > width2
            }
            return false
        }
        return sortedArray
    }

   private func removeRedundantVideoQualityOptions(videoQualityArray: [VideoQualityOption]) -> [VideoQualityOption] {
        var uniqueWidths = Set<String>()
        var filteredArray = [VideoQualityOption]()

        for option in videoQualityArray {
            if uniqueWidths.insert(option.qualityLabel).inserted {
                filteredArray.append(option)
            }
        }

        return filteredArray
    }


    func videoQualityArray(recipe: RecipeObject) -> [VideoQualityOption] {
        var videoQualityArray = [VideoQualityOption]()
        for rendition in recipe.renditions {
            if let url = URL(string: rendition.url) {
                if rendition.width != 1080 {
                    videoQualityArray.append(VideoQualityOption(qualityLabel: String(rendition.width), videoURL: url))
                } else {
                    if let originalVideoUrl = recipe.originalVideoURL {
                        videoQualityArray.append(VideoQualityOption(qualityLabel: String(rendition.width), videoURL: URL(string: originalVideoUrl)!))
                    }
                }
            }
        }
        let filteredArray = removeRedundantVideoQualityOptions(videoQualityArray: videoQualityArray)
        let sortedArray = sortVideoQualityArrayByWidth(videoQualityArray: filteredArray)
        return sortedArray
    }
}
