//
//  RecipeViewModelTest.swift
//  Recipe-AppTests
//
//  Created by Mohamed Salah on 13/09/2023.
//

import XCTest
import RxSwift
import RxRelay
import RxCocoa
import RxTest
import RxDataSources
@testable import Recipe_App

final class RecipeViewModelTest: XCTestCase {
    var disposeBag: DisposeBag!
    var sut: RecipeViewModel!
    var apiServiceMock: APIManagerMock!
    
    override func setUpWithError() throws {
        disposeBag = DisposeBag()
        apiServiceMock = APIManagerMock()
        sut = RecipeViewModel(apiManager: apiServiceMock)
    }
    
    override func tearDownWithError() throws {
        disposeBag = nil
        apiServiceMock = nil
        sut = nil
    }
    
    func test_Fetch_Global() {
        let expectedRecipeModel = Recipes(count: 20, results: [
            RecipeObject(id: 0,
                         instructions: [Instruction(displayText: "Test")],
                         userRatings: UserRatings(score: 0.0),
                         name: "Test",
                         createdAt: 0,
                         nutrition: Nutrition(sugar: 0),
                         description: "Test",
                         thumbnailURL: "Test",
                         updatedAt: 0,
                         renditions: [Rendition(url: "Test", width: 0)],
                         sections: [Section(components: [Component(rawText: "Test")])],
                         tags: [Tag(name: "Test")],
                         credits: [Credit(name: "Test")])
        ])
        apiServiceMock.fetchGlobalResult = Observable.just(expectedRecipeModel)
        
        var actualRecipes: Recipes?
        apiServiceMock.fetchGlobal(parsingType: Recipes.self, baseURL: APIManager.EndPoint.recipeList.stringToUrl)
            .subscribe(onNext: { recipesModel in
                actualRecipes = recipesModel
            })
            .disposed(by: disposeBag)
        
        XCTAssertEqual(actualRecipes, expectedRecipeModel)
    }
    func test_Fetch_Fails() {
        let expectedError = NSError(domain: "TestError", code: -1, userInfo: nil)
        apiServiceMock.fetchGlobalResult = Observable<Recipes>.error(expectedError)
        
        var actualError: Error?
        apiServiceMock.fetchGlobal(parsingType: Recipes.self, baseURL: APIManager.EndPoint.recipeList.stringToUrl)
            .subscribe(onError: { error in
                actualError = error
            })
            .disposed(by: disposeBag)
        
        XCTAssertEqual(actualError as NSError?, expectedError)
    }
    func test_Get_All_Currencies_Data() {
        let expectedRecipeModel = Recipes(count: 20, results: [
            RecipeObject(id: 0,
                         instructions: [Instruction(displayText: "Test")],
                         userRatings: UserRatings(score: 0.0),
                         name: "Test",
                         createdAt: 0,
                         nutrition: Nutrition(sugar: 0),
                         description: "Test",
                         thumbnailURL: "Test",
                         updatedAt: 0,
                         renditions: [Rendition(url: "Test", width: 0)],
                         sections: [Section(components: [Component(rawText: "Test")])],
                         tags: [Tag(name: "Test")],
                         credits: [Credit(name: "Test")])
        ])
        apiServiceMock.fetchGlobalResult = Observable.just(expectedRecipeModel)
        sut.getRecipes()
        XCTAssert(apiServiceMock!.fetchGlobalCalled)
    }
    
    func test_Extract_Names() {
        let creditNames = "Test1,Test2,Test3"
        let expectedNamesArray = ["Test1", "Test2", "Test3"]
        let result = sut.extractNames(from: creditNames)
        XCTAssertEqual(expectedNamesArray, result)
        
    }
    
    func test_MapValue() {
        let fromRange: ClosedRange<Double> = 0.0...1.0
        let toRange: ClosedRange<Double> = 0.0...100.0
        let value: Double = 0.5
        
        let mappedValue = sut.mapValue(fromRange: fromRange, toRange: toRange, value: value)
        
        XCTAssertEqual(mappedValue, 50.0)
    }
    
    func test_RatingColor() {
        let redColor = sut.ratingColor(rating: 3.0)
        let yellowColor = sut.ratingColor(rating: 6.0)
        let greenColor = sut.ratingColor(rating: 9.0)
        let blackColor = sut.ratingColor(rating: 11.0)
        
        XCTAssertEqual(redColor, .red)
        XCTAssertEqual(yellowColor, .yellow)
        XCTAssertEqual(greenColor, .green)
        XCTAssertEqual(blackColor, .black)
    }
    
    func test_ReturnTimeTier() {
        let under15Minutes = sut.returnTimeTier(timeTier: .under15Minutes)
        let under30Minutes = sut.returnTimeTier(timeTier: .under30Minutes)
        let under45Minutes = sut.returnTimeTier(timeTier: .under45Minutes)
        
        XCTAssertEqual(under15Minutes, "15min")
        XCTAssertEqual(under30Minutes, "30min")
        XCTAssertEqual(under45Minutes, "45min")
    }
    
    func testVideoQualityArray() {
        let rendition1 = Rendition(url: "https://s3.amazonaws.com/video-api-prod/assets/a0e1b07dc71c4ac6b378f24493ae2d85/FixedFBFinal.mp4", width: 720)
        let rendition2 = Rendition(url: "https://s3.amazonaws.com/video-api-prod/assets/a0e1b07dc71c4ac6b378f24493ae2d85/FixedFBFinal.mp4", width: 480)
        let rendition3 = Rendition(url: "https://s3.amazonaws.com/video-api-prod/assets/a0e1b07dc71c4ac6b378f24493ae2d85/FixedFBFinal.mp4", width: 1080)
        let recipeModel = RecipeObject(
            id: 0,
            originalVideoURL:"https://s3.amazonaws.com/video-api-prod/assets/a0e1b07dc71c4ac6b378f24493ae2d85/FixedFBFinal.mp4",
            instructions: [Instruction(displayText: "Test")],
            userRatings: UserRatings(score: 0.0),
            name: "Test",
            createdAt: 0,
            nutrition: Nutrition(sugar: 0),
            description: "Test",
            thumbnailURL: "Test",
            updatedAt: 0,
            renditions: [rendition1, rendition2, rendition3],
            sections: [Section(components: [Component(rawText: "Test")])],
            tags: [Tag(name: "Test")],
            credits: [Credit(name: "Test")]
        )
        
        
        let result = sut.videoQualityArray(recipe: recipeModel)
        
        let expectedQualityOptions: [VideoQualityOption] = [
            VideoQualityOption(qualityLabel: "1080", videoURL: URL(string: "https://s3.amazonaws.com/video-api-prod/assets/a0e1b07dc71c4ac6b378f24493ae2d85/FixedFBFinal.mp4")!),
            VideoQualityOption(qualityLabel: "720", videoURL: URL(string: "https://s3.amazonaws.com/video-api-prod/assets/a0e1b07dc71c4ac6b378f24493ae2d85/FixedFBFinal.mp4")!),
            VideoQualityOption(qualityLabel: "480", videoURL: URL(string: "https://s3.amazonaws.com/video-api-prod/assets/a0e1b07dc71c4ac6b378f24493ae2d85/FixedFBFinal.mp4")!)
        ]
        
        XCTAssertEqual(result, expectedQualityOptions)
    }
    
}
