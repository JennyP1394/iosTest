//
//  ErrorObjectClass.swift
//  MovieDBApp
//
//  Created by Janki on 11/11/22.
//

import Foundation

// MARK: - ErrorObject
class ErrorObject: Codable {
    let message: String
    let key: String?
    let sysMessage: String?
}
