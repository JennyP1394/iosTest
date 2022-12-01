//
//  MoviewList+PickerDatasource.swift
//  MovieDBApp
//
//  Created by Janki on 14/11/22.
//

import Foundation
import UIKit

extension MovieListVC: UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - UIPickerView DataSource & Delegate Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.viewModal.pickerData.count

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.viewModal.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.viewModal.sortingType = SortingType(rawValue: row) ?? .popularity
        picker.selectRow(row, inComponent: component, animated: true)
    }
    // MARK: - Set Picker Data
    func setPickerData(sortingType: SortingType) {
        switch sortingType {
        case .popularity:
            self.viewModal.arrMovie = self.viewModal.arrMovie.sorted { a, b in
                a.popularity ?? 0.0 > b.popularity ?? 0.0
            }
        case .rating:
            self.viewModal.arrMovie = self.viewModal.arrMovie.sorted { a, b in
                  a.voteAverage ?? 0.0 > b.voteAverage ?? 0.0
              }
        }
        reloadCollectionViewData()
    }
}
