//
//  MovieListVC+API.swift
//  MovieDBApp
//
//  Created by Janki on 11/11/22.
//

import UIKit

extension MovieListVC {
    // MARK: - API calls
    func getPopularMoviewListApi() {
        if checkNetworkConnection() {
            MovieListViewModal.shared.getAccountList(nextPage: viewModal.nextPage) { [weak self] movielist, message in
                self?.removeActivityIndicator()
                self?.viewModal.loadState = .none
                if self?.viewModal.nextPage ?? 1 == 1 {
                    self?.viewModal.arrMovie = movielist?.results ?? []
                } else {
                    self?.viewModal.arrMovie.append(contentsOf: movielist?.results ?? [])
                }
                self?.viewModal.nextPage = (movielist?.page ?? 1) + 1
                if let sortingType = self?.viewModal.sortingType {
                    self?.setPickerData(sortingType: sortingType)
                }
            }
        }
    }
}
