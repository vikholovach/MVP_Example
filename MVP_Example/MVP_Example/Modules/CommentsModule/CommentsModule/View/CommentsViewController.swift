//
//  CommentsViewController.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import UIKit

class CommentsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Presenter
    var presenter: CommentsViewPresenterProtocol!
    
    //DataSource
    private var dataSource: UITableViewDiffableDataSource<Sections, Comment>!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.fetchComments()
        initTableView()
        initDataSource()
    }
    
    //MARK: - Methods
    private func initTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func initDataSource() {
        self.dataSource = UITableViewDiffableDataSource(
            tableView: self.tableView,
            cellProvider: { tableView, indexPath, item -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.text = "Name: \(item.name) \nComment: \(item.body)"
                return cell
            })
    }
    
    func reloadData() {
        guard let comments = self.presenter.comments else {return}
        var snapshoot = NSDiffableDataSourceSnapshot<Sections, Comment>()
        snapshoot.appendSections([.user])
        snapshoot.appendItems(comments)
        self.dataSource.apply(snapshoot, animatingDifferences: true)
    }
    
}

