//
//  MovieCollectionViewCell.swift
//  MovieDBApp
//
//  Created by Janki on 11/11/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var coverImgView: UIImageView!

    // MARK: Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - User defined methods
    func configureMovieCollectionViewCell(model: MovieResult) {
        if let posterPath = model.posterPath {
            self.coverImgView.contentMode = .scaleAspectFill
            self.coverImgView.sd_setImage(with: URL(string: "\(StringConstants.imageURL)\(posterPath)"), placeholderImage: UIImage(named: Assets.placeholder))
        }
    }

}
