//
//  RecipeDataManager.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 12/09/2023.
//

import UIKit
import CoreData

class RecipeDataManager {
    
    private static let sharedInstance = RecipeDataManager()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func shared() -> RecipeDataManager {
        return RecipeDataManager.sharedInstance
    }
    func getAllRecipes() -> [RecipeObject] {
        do {
            let recipes = try context.fetch(Recipe.fetchRequest())
            return convertRecipeToRecipeObject(recipes: recipes)
        } catch {
            print("Failed to fetch all recipes: \(error)")
            
        }
        return [RecipeObject]()
    }
    func createRecipe(recipe: RecipeObject) {
        let _ = convertRecipeObjectToRecipe(recipe: recipe)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    func isRecipeFavorited(id: Int32) -> Bool {
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)

        do {
            let recipes = try context.fetch(fetchRequest)
            if let _ = recipes.first {
                return true
            }
        } catch {
            print("Failed to fetch recipe with id \(id): \(error)")
        }
        
        return false
    }
    func deleteRecipe(recipe: RecipeObject) {
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", recipe.id)

        do {
            let recipes = try context.fetch(fetchRequest)
            if let recipeToBeDeleted = recipes.first {
                context.delete(recipeToBeDeleted)
                try context.save()
            }
        } catch {
            print("Failed to fetch or delete recipe: \(error)")
        }
    }

    func convertRecipeObjectToRecipe(recipe: RecipeObject) -> Recipe {
        let newItem = Recipe(context: context)
        newItem.id = Int32(recipe.id)
        newItem.originalVideoURL = recipe.originalVideoURL
        newItem.country = recipe.country
        newItem.instructions = convertItemsToStringArray(recipe.instructions) { $0.displayText }
        newItem.userRatings = recipe.userRatings.score
        newItem.name = recipe.name
        newItem.createdAt = Int32(recipe.createdAt)
        newItem.recipeDescription = recipe.description
        newItem.thumbnailURL = recipe.thumbnailURL
        newItem.totalTimeTier = recipe.totalTimeTier?.displayTier?.rawValue
        newItem.language = recipe.language
        newItem.updatedAt = Int32(recipe.updatedAt)
        newItem.section = convertItemsToStringArray(recipe.sections[0].components) { $0.rawText }
        newItem.tags = convertItemsToStringArray(recipe.tags) { $0.name }
        newItem.credits = convertItemsToStringArray(recipe.credits) { $0.name ?? "N/A" }
        newItem.rendition = convertRenditionToDictionary(renditons: recipe.renditions)
        
        
        let nutritionLocal = NutritionLocal(context: context)
        nutritionLocal.calories = Int16(recipe.nutrition.calories ?? 0)
        nutritionLocal.carbohydrates = Int16(recipe.nutrition.carbohydrates ?? 0)
        nutritionLocal.fat = Int16(recipe.nutrition.fat ?? 0)
        nutritionLocal.fiber = Int16(recipe.nutrition.fiber ?? 0)
        nutritionLocal.protein = Int16(recipe.nutrition.protein ?? 0)
        nutritionLocal.sugar = Int16(recipe.nutrition.sugar ?? 0)
        newItem.nutritionLocal = nutritionLocal
        return newItem
    }
    func convertRecipeToRecipeObject(recipes: [Recipe]) -> [RecipeObject] {
        return recipes.map { recipe in
            let instructions = convertInstructions(recipe.instructions)
            let nutrition = convertNutrition(recipe.nutritionLocal)
            let sections = [convertSections(recipe.section)]
            let tags = convertStringsToTags(recipe.tags)
            let credits = convertStringsToCredits(recipe.credits)
            let displayTier = retrievTimeTier(timeTier: recipe.totalTimeTier ?? "")
            return RecipeObject(
                id: Int(recipe.id),
                originalVideoURL: recipe.originalVideoURL,
                country: recipe.country,
                instructions: instructions,
                userRatings: UserRatings(score: Double(recipe.userRatings)),
                name: recipe.name ?? "N/A",
                createdAt: Int(recipe.createdAt),
                nutrition: nutrition,
                description: recipe.recipeDescription ?? "N/A",
                thumbnailURL: recipe.thumbnailURL ?? "N/A",
                totalTimeTier: TotalTimeTier(displayTier: displayTier),
                language: recipe.language,
                updatedAt: Int(recipe.updatedAt),
                renditions: convertDictionaryToRenditions(recipe.rendition ?? [["":""]]),
                sections: sections,
                tags: tags,
                credits: credits
            )
        }
    }
//MARK: - Helper Functions
    
    func convertInstructions(_ instructions: [String]?) -> [Instruction] {
        return instructions?.map { Instruction(displayText: $0) } ?? []
    }
    func convertNutrition(_ nutritionLocal: NutritionLocal?) -> Nutrition {
        let protein = Int(nutritionLocal?.protein ?? 0)
        let fat = Int(nutritionLocal?.fat ?? 0)
        let calories = Int(nutritionLocal?.calories ?? 0)
        let carbohydrates = Int(nutritionLocal?.carbohydrates ?? 0)
        let sugar = Int(nutritionLocal?.sugar ?? 0)
        let fiber = Int(nutritionLocal?.fiber ?? 0)

        return Nutrition(
            protein: protein,
            fat: fat,
            calories: calories,
            sugar: sugar,
            carbohydrates: carbohydrates,
            fiber: fiber
        )
    }
    func convertSections(_ section: [String]?) -> Section {
        let components = convertStringsToItems(section ?? []) { Component(rawText: $0) }
        return Section(components: components)
    }

    func convertStringsToTags(_ tags: [String]?) -> [Tag] {
        return convertStringsToItems(tags ?? []) { Tag(name: $0) }
    }

    func convertStringsToCredits(_ credits: [String]?) -> [Credit] {
        return convertStringsToItems(credits ?? []) { Credit(name: $0) }
    }

    func convertItemsToStringArray<T>(_ items: [T], transform: (T) -> String) -> [String] {
        return items.map { transform($0) }
    }
    func convertStringsToItems<T>(_ strings: [String], transform: (String) -> T?) -> [T] {
        return strings.compactMap { transform($0) }
    }
    func convertRenditionToDictionary(renditons: [Rendition]) -> [[String:String]] {
        print(renditons.map { element in
            ["qualityLabel":String(element.width), "videoURL":element.url]
        })
        return renditons.map { element in
            ["qualityLabel":String(element.width), "videoURL":element.url]
        }
    }
    func convertDictionaryToRenditions(_ dictionaries: [[String: Any]]) -> [Rendition] {
        var renditionArray = [Rendition]()
        for dict in dictionaries {
            if let widthString = dict["qualityLabel"] as? String, let videoURL = dict["videoURL"] as? String, let width = Int(widthString) {
                let rendition = Rendition(url: videoURL, width: width)
                renditionArray.append(rendition)
            }
        }
        return renditionArray
    }
    func retrievTimeTier(timeTier: String) -> DisplayTier {
        switch timeTier {
        case "Under 15 minutes":
            return .under15Minutes
        case "Under 30 minutes":
            return .under30Minutes
        case "Under 45 minutes":
            return .under45Minutes
        default:
            return .under30Minutes
        }
    }

}
