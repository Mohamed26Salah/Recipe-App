//
//  APIManager.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//

import Foundation
import UIKit

class APIManager {
    func test() {
        let headers = [
            "X-RapidAPI-Key": "24bfbf74f8mshd70a51277440043p144846jsn5651052b0f4b",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(data)
                print(httpResponse)
            }
        })

        dataTask.resume()
    }
}
