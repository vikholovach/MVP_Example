//
//  ModuleBuilder.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 10.08.2023.
//

import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    //tabbar
    func createTabbar() -> UITabBarController
    //users
    func createUsersModule(with router: RouterProtocol) -> UIViewController
    func createUserdDetailModule(with router: RouterProtocol, and user: User? ) -> UIViewController
    //comments
    func createCommentsModule(with router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol  {
    //MARK: - Tabbar
    func createTabbar() -> UITabBarController {
        let tabbarController = UITabBarController()
        //init ui
        tabbarController.tabBar.barTintColor = .systemRed
        tabbarController.tabBar.tintColor = .systemRed
        tabbarController.tabBar.unselectedItemTintColor = .systemGray
        tabbarController.tabBar.backgroundColor = .white
        tabbarController.tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = .white
        return tabbarController
    }
    
    //MARK: - Users
    func createUsersModule(with router: RouterProtocol) -> UIViewController {
        let view = UsersViewController()
        let networkService = NetworkService()
        let presenter = UserMainPresenter(
            view: view,
            networkService: networkService,
            router: router)
        view.presenter = presenter
        return view
    }
    
    //MARK: - User Description
    func createUserdDetailModule(with router: RouterProtocol, and user: User?) -> UIViewController {
        let view = UserDetailViewController()
        let networkService = NetworkService()
        let presenter = UserDetailPresener(
            view: view,
            networkService: networkService,
            user: user,
            router: router)
        view.presenter = presenter
        return view
    }
    
    //MARK: - Comments
    func createCommentsModule(with router: RouterProtocol) -> UIViewController {
        let view = CommentsViewController()
        let networkService = NetworkService()
        let presenter = CommentsPresenter(
            view: view,
            networkService: networkService,
            router: router)
        view.presenter = presenter
        return view
    }
}
