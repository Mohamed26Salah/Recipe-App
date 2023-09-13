//
//  RecipeDataManagerTest.swift
//  Recipe-AppTests
//
//  Created by Mohamed Salah on 13/09/2023.
//

import XCTest
@testable import Recipe_App

final class RecipeDataManagerTest: XCTestCase {
    var dataManager: RecipeDataManager!
    
    override func setUpWithError() throws {
        dataManager = RecipeDataManager()
    }
    
    override func tearDownWithError() throws {
        dataManager = nil
    }
    func testConvertSections() {
        let section = ["Section 1", "Section 2", "Section 3"]
        let result = dataManager.convertSections(section)
        
        XCTAssertEqual(result.components.count, 3)
        XCTAssertEqual(result.components[0].rawText, "Section 1")
        XCTAssertEqual(result.components[1].rawText, "Section 2")
        XCTAssertEqual(result.components[2].rawText, "Section 3")
    }
    func testConvertStringsToTags() {
        let tags = ["Tag1", "Tag2", "Tag3"]
        let result = dataManager.convertStringsToTags(tags)
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0].name, "Tag1")
        XCTAssertEqual(result[1].name, "Tag2")
        XCTAssertEqual(result[2].name, "Tag3")
    }
    
    func testConvertStringsToCredits() {
        let credits = ["Credit1", "Credit2", "Credit3"]
        let result = dataManager.convertStringsToCredits(credits)
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0].name, "Credit1")
        XCTAssertEqual(result[1].name, "Credit2")
        XCTAssertEqual(result[2].name, "Credit3")
    }
    
    func testConvertItemsToStringArray() {
        let items = [1, 2, 3]
        let result = dataManager.convertItemsToStringArray(items) { String($0) }
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0], "1")
        XCTAssertEqual(result[1], "2")
        XCTAssertEqual(result[2], "3")
    }
    
    func testConvertRenditionToDictionary() {
        let renditions = [Rendition(url: "URL1", width: 720), Rendition(url: "URL2", width: 1080)]
        let result = dataManager.convertRenditionToDictionary(renditons: renditions)
        
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0]["qualityLabel"], "720")
        XCTAssertEqual(result[0]["videoURL"], "URL1")
        XCTAssertEqual(result[1]["qualityLabel"], "1080")
        XCTAssertEqual(result[1]["videoURL"], "URL2")
    }
    
    func testConvertDictionaryToRenditions() {
        let dictionaries = [["qualityLabel": "720", "videoURL": "URL1"], ["qualityLabel": "1080", "videoURL": "URL2"]]
        let result = dataManager.convertDictionaryToRenditions(dictionaries)
        
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].width, 720)
        XCTAssertEqual(result[0].url, "URL1")
        XCTAssertEqual(result[1].width, 1080)
        XCTAssertEqual(result[1].url, "URL2")
    }
    
    func testRetrievTimeTier() {
        let under15MinutesTier = dataManager.retrievTimeTier(timeTier: "Under 15 minutes")
        let under30MinutesTier = dataManager.retrievTimeTier(timeTier: "Under 30 minutes")
        let under45MinutesTier = dataManager.retrievTimeTier(timeTier: "Under 45 minutes")
        let defaultTier = dataManager.retrievTimeTier(timeTier: "Unknown")
        
        XCTAssertEqual(under15MinutesTier, .under15Minutes)
        XCTAssertEqual(under30MinutesTier, .under30Minutes)
        XCTAssertEqual(under45MinutesTier, .under45Minutes)
        XCTAssertEqual(defaultTier, .under30Minutes)
    }
    
}
