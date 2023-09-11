//
//  Int + Extenstion.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 11/09/2023.
//

import Foundation
extension Int {
    func formattedDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
