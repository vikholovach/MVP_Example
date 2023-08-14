//
//  UsersViewController+UserViewProtocol.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import UIKit

extension UsersViewController: UserViewProtocol {

    func onSuccess() {
        self.reloadData()
    }
    
    func onFailure(with error: String) {
        let alert = UIAlertController(
            title: "Error",
            message: error,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .cancel))
        self.present(alert, animated: true)
    }
    
}
