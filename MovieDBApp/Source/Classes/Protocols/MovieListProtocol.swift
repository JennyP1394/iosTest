//
//  MovieListProtocol.swift
//  MovieDBApp
//
//  Created by Janki on 14/11/22.
//

import Foundation
import UIKit

// MARK: Protocol
protocol MovieListProtocol: AnyObject {
    func routeToMoviewDetail(moviedetails: MovieResult, navigationController: UINavigationController?)
}

// MARK: Protocol Extention
extension MovieListProtocol {
    func routeToMoviewDetail(moviedetails: MovieResult, navigationController: UINavigationController?) {
        let scene = MoviewDetailsVC.setupVCWithStoryBoardIdentifier(with: .main)
        scene.movieListObject = moviedetails
        navigationController?.pushViewController(scene, animated: true)
    }
}
