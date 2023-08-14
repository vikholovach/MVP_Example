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
    func initTabbar()
    func createUsersController() -> UIViewController
    func createCommentsController() -> UIViewController
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
    
    func initTabbar() {
        let usersController = createUsersController()
        let commentsController = createCommentsController()
        guard let tabbarController = self.assemblyBuilder?.createTabbar() else { return }
        tabbarController.viewControllers = [
            usersController,
            commentsController
        ]
    
        navigationController?.viewControllers = [tabbarController]
    }
    
    func createUsersController() -> UIViewController {
        guard let usersViewController = self.assemblyBuilder?.createUsersModule(with: self) else { return UIViewController() }
        usersViewController.tabBarItem.title = "User"
        usersViewController.tabBarItem.image = UIImage(systemName: "person.fill")?.withTintColor(.lightGray)
        usersViewController.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withTintColor(.systemRed)
        return usersViewController
    }
    
    func createCommentsController() -> UIViewController {
        guard let commentsViewController = self.assemblyBuilder?.createCommentsModule(with: self) else { return UIViewController() }
        commentsViewController.tabBarItem.title = "Comments"
        commentsViewController.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle.fill")?.withTintColor(.lightGray)
        commentsViewController.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.rectangle.fill")?.withTintColor(.systemRed)
        return commentsViewController
    }
    
    
    func showUserDetail(with user: User?) {
        guard let userDetailViewController = self.assemblyBuilder?.createUserdDetailModule(with: self, and: user) else { return }
        navigationController?.pushViewController(userDetailViewController, animated: true)
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}
