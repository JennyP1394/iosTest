//
//  BaseVC.swift
//  MovieDBApp
//
//  Created by Janki on 14/11/22.
//

import UIKit
import Foundation

// MARK: - BaseVC
class BaseVC: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //Check Network Connection
    func checkNetworkConnection() -> Bool {
        if APIManager.isNetworkConnected() {
            return true
        } else {
            self.showAlertController(title: StringConstants.strNoInternet,
                                     msg: "", completion: nil)
            return false
        }
    }
    func showHideTabBar(isHide: Bool) {
        self.tabBarController?.tabBar.isHidden = isHide
    }
     func removeActivityIndicator(fromView: UIView? = nil) {
        if fromView != nil {
            if let subview = fromView?.viewWithTag(loaderTag) {
                subview.removeFromSuperview()
            }
        } else {
            if let subview = appDelegate?.window?.viewWithTag(loaderTag) {
                subview.removeFromSuperview()
            }
        }
    }
    func showAlertController(title: String = "",
                             msg: String,
                             completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .cancel, handler: completion))
        self.present(alert, animated: true)
    }
}

// MARK: - UIViewController Extension
extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }
    class func setupVCWithStoryBoardIdentifier(with storyboard: AppStoryboard) -> Self {
        let vvc =  storyboard.viewControllerFromStoryboard(vvc: self)
        return vvc
    }
}
