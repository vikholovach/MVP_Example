//
//  UsersViewController+TableViewDelegate.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import UIKit

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = dataSource.itemIdentifier(for: indexPath) else {return}
        let userDetailViewController = Builder.createUserdDetailModule(with: user)
        self.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}
