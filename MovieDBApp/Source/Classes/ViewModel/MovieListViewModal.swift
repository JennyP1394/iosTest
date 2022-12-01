//
//  MovieListViewModal.swift
//  MovieDBApp
//
//  Created by Janki on 11/11/22.
//

import UIKit

// MARK: - MovieListViewModal class
class MovieListViewModal: BaseViewModel {
    static let shared = MovieListViewModal()
    let apiManager = APIManager.shared()
    var arrMovie = [MovieResult]()
    var loadState = LoadMoreState.none
    var nextPage: Int = 1
    var pickerData: [String] = [StringConstants.strSortByPopularity, StringConstants.strSortByRating]
    var sortingType = SortingType.popularity
}

// MARK: - API definition
extension MovieListViewModal {
    func getAccountList(nextPage: Int, _ completion : @escaping (MovieListResponseBody?, AlertMessage?) -> Void) {
        if APIManager.isNetworkConnected() {
            self.apiManager.call(type: EndpointItem.getMovieList(StringConstants.ApiKey, "\(nextPage)") as EndPointType, params: nil) { (_ movieListResponseBody, errorMessage) in
                completion(movieListResponseBody, errorMessage)
            }
        }
    }
}

