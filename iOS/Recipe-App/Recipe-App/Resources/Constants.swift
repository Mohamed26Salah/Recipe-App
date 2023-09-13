//
//  Constants.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//


import Foundation

struct K {
    struct Links {
        static let baseUrl = "https://tasty.p.rapidapi.com/recipes/"
        static let apiKey = "6660cd5c64mshaeb2df05c204f40p130446jsnfb36e6aee035"
        static let apiKey2 = "24bfbf74f8mshd70a51277440043p144846jsn5651052b0f4b"
    }
    struct cellsResuable {
        static let FoodTVC = "FoodTVC"
        static let IngredientsTVC = "IngredientsTVC"
        static let InstructionTVC = "InstructionTVC"
        static let NutritionTVC = "NutritionTVC"
    }
    struct ViewsControllers {
        static let UITabBarVC = "UITabBarVC"
        static let homeViewController = "HomeVC"
        static let FavouritesViewController = "FavouritesVC"
        static let FoodDetailsVC = "FoodDetailsVC"

    }
    struct ImageAssets {
        static let splashScreenImage = "splashScreenImage"
        static let YummyImage = "Yummy"
        static let getStartButton = "getStartedButtonImage"
        static let splashScreenImageBlurred = "splashScreenImageBlurred"
        static let savedImage = "Saved"
        static let UnsavedImage = "UnSaved"
        static let leftArrow = "left-arrow2"
    }
    struct UserDefaults {
        static let hasSeenOnboarding = "hasSeenOnboarding"
    }
}
