//
//  ViewController.swift
//  MovieDBApp
//
//  Created by Janki on 09/11/22.
//

import UIKit

class MovieListVC: BaseVC, MovieListProtocol {
    // MARK: IBOutlets
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerBgView: UIView!

    // MARK: Variables
    var viewModal = MovieListViewModal()
    weak var moviewlistDelegate: MovieListProtocol?


    // MARK: - View life-cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInitialViewData() 
        self.getPopularMoviewListApi()
    }
    
    // MARK: - UIButton Actions
    @IBAction func sortButtonAction(_ sender: UIBarButtonItem) {
        pickerBgView.isHidden = false
    }
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        pickerBgView.isHidden = true
        setPickerData(sortingType: self.viewModal.sortingType)
    }
}

