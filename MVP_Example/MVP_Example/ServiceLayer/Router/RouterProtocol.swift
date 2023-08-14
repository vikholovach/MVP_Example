//
//  RouterProtocol.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import UIKit

protocol RouterMainProtocol: AnyObject {
    var navigationController: UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMainProtocol {
    func usersViewController()
    func showUserDetail(with user: User?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    //MARK: - Init
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func usersViewController() {
        guard let usersViewController = self.assemblyBuilder?.createUsersModule(with: self) else { return }
        navigationController?.viewControllers = [usersViewController]
    }
    
    func showUserDetail(with user: User?) {
        guard let userDetailViewController = self.assemblyBuilder?.createUserdDetailModule(with: self, and: user) else { return }
        navigationController?.pushViewController(userDetailViewController, animated: true)
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}
