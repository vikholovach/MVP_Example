//
//  PersonsViewController.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 10.08.2023.
//

import UIKit

class UsersViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UserViewPresenterProtocol!
    
    //MARK: - DataSource
    var dataSource: UITableViewDiffableDataSource<Sections, User>!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDataSource()
        reloadData()
    }
    
    
    //MARK: - Methods
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
    }
    
    private func setupDataSource() {
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, item -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = item.name
                cell.textLabel?.numberOfLines = 0
                return cell
            })
    }
    
    private func reloadData() {
        guard let users = presenter.users else {return}
        var snapshoot = NSDiffableDataSourceSnapshot<Sections, User>()
        snapshoot.appendSections([.user])
        snapshoot.appendItems(users)
        dataSource.apply(snapshoot, animatingDifferences: true)
    }
    
}

//MARK: - UserViewProtocol
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



