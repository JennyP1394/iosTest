//
//  Constants.swift
//  MovieDBApp
//
//  Created by Janki on 14/11/22.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate
let loaderTag = 1110000111

// MARK: - StringConstants
struct StringConstants {
    static var ApiKey = "a422000d1c4973ddd186a9e4b6a07fee"
    static var imageURL = "https://image.tmdb.org/t/p/original"
    static var baseURL = "https://api.themoviedb.org/3" //Improvement : We can save Base url in User defined settings and fetch from there.
    static var strSortByPopularity = "Sort by Popularity"
    static var strSortByRating = "Sort by Rating"
    static var strNoInternet = "Please check your internet connection and try again"
    static var strReleaseDate = "Release Date"
    static var strRating = "Rating"
    static var strLang = "Language"

}
struct Assets {
    static var placeholder = "placeholder"
}
struct CustomCellName {
    static let kMovieCollectionViewCell = "MovieCollectionViewCell"
}

// MARK: - Enums
enum LoadMoreState {
    case initiated, none, loaded
}
enum SortingType: Int {
    case popularity = 0
    case rating = 1
}
enum AppStoryboard: String {
    case main = "Main"
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    func viewControllerFromStoryboard<T: UIViewController>(vvc: T.Type) -> T {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: vvc.identifier) as? T else {
            fatalError()
        }
        return viewController
    }
}
