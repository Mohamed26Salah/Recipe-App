//
//  APIManagerMock.swift
//  Recipe-AppTests
//
//  Created by Mohamed Salah on 13/09/2023.
//

import Foundation
import RxTest
import RxSwift
import RxCocoa
import RxRelay
@testable import Recipe_App

class APIManagerMock: APIClientProtocol {
    var fetchGlobalCalled = false
    var fetchGlobalResult: Any?
    
    var fetchLocalFileCalled = false
    var fetchLocalFileResult: Any?
    
    func fetchGlobal<T: Codable>(
        parsingType: T.Type,
        baseURL: URL,
        attributes: [String]? = nil,
        queryParameters: [String: String]? = nil,
        jsonBody: [String: Any]? = nil,
        headers: [String: String]? = nil
    ) -> Observable<T> {
        fetchGlobalCalled = true
        return fetchGlobalResult as! Observable<T>
    }
    func fetchLocalFile<T: Codable>(
            parsingType: T.Type,
            localFilePath: URL
        ) -> Observable<T> {
            fetchLocalFileCalled = true
            return fetchLocalFileResult as! Observable<T>
    }
}
