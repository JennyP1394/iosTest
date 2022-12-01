//
//  MovieListVC+Datasource.swift
//  MovieDBApp
//
//  Created by Janki on 11/11/22.
//

import UIKit
import SDWebImage

extension MovieListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - Set Initial Data
    func setInitialViewData() {
        self.moviewlistDelegate = self
        registerCollectionViewCell()
        setPicker()
        collectionViewSetUp()
        reloadCollectionViewData()
    }
    private func setPicker() {
        self.picker.delegate = self
        self.picker.dataSource = self
        self.picker.accessibilityNavigationStyle = .combined
        self.pickerBgView.isHidden = true
    }
    internal func registerCollectionViewCell() {
        self.movieCollectionView.register(UINib(nibName: CustomCellName.kMovieCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CustomCellName.kMovieCollectionViewCell)
    }
    func collectionViewSetUp() {
        let flow = movieCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let itemSpacing: CGFloat = 30
        let height = 200
        print("height ---- \(height)")
        flow?.itemSize = CGSize(width: Int((UIScreen.main.bounds.size.width)-itemSpacing)/2, height: Int((UIScreen.main.bounds.size.height)-itemSpacing)/3)
        flow?.minimumInteritemSpacing = 8
        flow?.minimumLineSpacing = 20
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.allowsMultipleSelection = false
    }
    func reloadCollectionViewData() {
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
        }
    }
    // MARK: - UICollectionView DataSource & Delegate Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModal.arrMovie.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellName.kMovieCollectionViewCell, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        cell.configureMovieCollectionViewCell(model: self.viewModal.arrMovie[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moviewlistDelegate?.routeToMoviewDetail(moviedetails: self.viewModal.arrMovie[indexPath.item], navigationController: self.navigationController)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loadMoreData()
    }
    // MARK: - User defined methods
    func loadMoreData() {
        if self.viewModal.loadState != .none || self.viewModal.nextPage <= 1 { return }
        self.viewModal.loadState = .initiated
        if(self.movieCollectionView.contentOffset.y >= (self.movieCollectionView.contentSize.height - self.movieCollectionView.bounds.size.height)) {
            self.viewModal.loadState = .initiated
            self.getPopularMoviewListApi()
        }else {
            self.viewModal.loadState = .none
        }
       
    }
}
