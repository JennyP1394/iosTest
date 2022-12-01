//
//  MoviewDetailsVC.swift
//  MovieDBApp
//
//  Created by Janki on 14/11/22.
//

import UIKit
import SDWebImage

class MoviewDetailsVC: BaseVC {

    // MARK: IBOutlets
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieDescription: UILabel!
    @IBOutlet weak var lblTxtReleaseDate: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblTxtRating: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblTxtLanguage: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!

    // MARK: Variables
    var movieListObject: MovieResult?
    
    // MARK: - View life-cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    // MARK: - User defined methods
    func setData() {
        guard let movieListObject = movieListObject else {
            return
        }
        lblMovieTitle.text = movieListObject.originalTitle
        lblMovieDescription.text = movieListObject.overview
        lblTxtReleaseDate.text = StringConstants.strReleaseDate
        if let dt = movieListObject.releaseDate{
            lblReleaseDate.text = DateUtils.convertDateFormateFromYYYYMMDDToDDMMYYYY(dateStr: dt)
        }
        lblTxtRating.text = StringConstants.strRating
        lblRating.text = "\(movieListObject.voteAverage ?? 0.0)"
        lblTxtLanguage.text = StringConstants.strLang
        lblLanguage.text = movieListObject.originalLanguage
        if let posterPath = movieListObject.posterPath {
            self.imgPoster.contentMode = .scaleAspectFill
            self.imgPoster.sd_setImage(with: URL(string: "\(StringConstants.imageURL)\(posterPath)"), placeholderImage: UIImage(named: Assets.placeholder))
        }
    }
    
    // MARK: - UIButton Actions
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
