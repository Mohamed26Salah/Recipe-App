//
//  Recipe+CoreDataProperties.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 12/09/2023.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: Int32
    @NSManaged public var originalVideoURL: String?
    @NSManaged public var country: String?
    @NSManaged public var instructions: [String]?
    @NSManaged public var userRatings: Double
    @NSManaged public var name: String?
    @NSManaged public var createdAt: Int32
    @NSManaged public var recipeDescription: String?
    @NSManaged public var thumbnailURL: String?
    @NSManaged public var totalTimeTier: String?
    @NSManaged public var language: String?
    @NSManaged public var updatedAt: Int32
    @NSManaged public var section: [String]?
    @NSManaged public var tags: [String]?
    @NSManaged public var credits: [String]?
    @NSManaged public var rendition: [[String:Any]]?
    @NSManaged public var nutritionLocal: NutritionLocal?

}

extension Recipe : Identifiable {

}
