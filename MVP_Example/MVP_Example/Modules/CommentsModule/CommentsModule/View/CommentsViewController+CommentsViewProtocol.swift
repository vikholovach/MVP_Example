//
//  CommentsViewController+CommentsViewProtocol.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import UIKit

extension CommentsViewController: CommentsViewProtocol {
    func onSuccess() {
        reloadData()
    }
    
    func onError(with error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .cancel))
        self.present(alert, animated: true)
    }
    
    
}
