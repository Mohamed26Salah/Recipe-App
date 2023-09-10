//
//  Constants.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//


import Foundation

struct K {
    struct Links {
        static let baseUrl = "http://data.fixer.io/api/"
        static let apiKey = "186ae7c2f82e18c99010440083889b49"
    }
    struct cellsResuable {
        static let FoodTVC = "FoodTVC"
        static let IngredientsTVC = "IngredientsTVC"
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
