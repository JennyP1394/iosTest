//
//  BaseViewModel.swift
//  MovieDBApp
//
//  Created by Janki on 11/11/22.
//

import Foundation
// MARK: - BaseViewModel
class BaseViewModel {
    var postParams: [String: Any]?

    func decode<T>(modelType: T) where T: Encodable {
        do {
            let jsonData = try JSONEncoder().encode(modelType)
            if let aPostParams  = try (JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions()) as? [ String: Any]) {
                postParams = aPostParams
            }
        } catch {
            // Some parsing issue.
        }
    }
}
