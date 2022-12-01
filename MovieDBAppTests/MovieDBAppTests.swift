//
//  MovieDBAppTests.swift
//  MovieDBAppTests
//
//  Created by Janki on 09/11/22.
//

import XCTest
@testable import MovieDBApp

final class MovieDBAppTests: XCTestCase {
    var movieListVCTest: MovieListVC!
    var movieListVMTest: MovieListViewModal!

    override func setUp() {
        super.setUp()
        self.movieListVCTest = MovieListVC.setupVCWithStoryBoardIdentifier(with: .main)
        self.movieListVCTest.loadView()
        movieListVCTest.viewDidLoad()
    }
    func testHasACollectionView() {
        XCTAssertNotNil(self.movieListVCTest.movieCollectionView)
    }
    func testCollectionViewHasDelegate() {
        XCTAssertNotNil(self.movieListVCTest.movieCollectionView?.delegate)
    }
    func testCollectionViewHasDataSource() {
        XCTAssertNotNil(self.movieListVCTest.movieCollectionView?.dataSource)
    }
    func testCollectionViewConformsToDataSourceProtocol() {
        XCTAssertTrue(self.movieListVCTest.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(
            self.movieListVCTest.responds(
                to: #selector(self.movieListVCTest.collectionView(_:numberOfItemsInSection:))))
        XCTAssertTrue(self.movieListVCTest.responds(to: #selector(self.movieListVCTest.collectionView(_:cellForItemAt:))))
    }
    func testCollectionViewCellHasReuseIdentifier() {
        guard let _ = self.movieListVMTest else { return }
        if self.movieListVMTest.arrMovie.count < 1 { return }
        let cell = self.movieListVCTest.movieCollectionView.cellForItem(at: IndexPath(row: 0,
                                                                           section: 0)) as? MovieCollectionViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "MovieCollectionViewCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    func testMovieListAPI() {
        guard let _ = self.movieListVMTest else { return }
        var model = MovieListResponseBody.init()
        let exp = expectation(description: "myExpectation")
        movieListVMTest.getAccountList(nextPage: 1) { res, msg in
            if let res1 = res {
                model = res1
            }
            DispatchQueue.main.async {
                exp.fulfill()
            }
            XCTAssertEqual(model.results?.count ?? 0>0, true)
        }
        self.wait(for: [exp], timeout: 60)
    }
    func testMethodCalled() {
        self.movieListVCTest.doneButtonAction(UIBarButtonItem())
        self.movieListVCTest.sortButtonAction(UIBarButtonItem())

    }
    override func tearDown() {
        self.movieListVCTest = nil
        self.movieListVMTest = nil
    }


}
