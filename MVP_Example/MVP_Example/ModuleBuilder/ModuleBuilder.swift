//
//  ModuleBuilder.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 10.08.2023.
//

import UIKit

protocol ModuleBuilder: AnyObject {
    static func createUsersModule() -> UIViewController
    static func createUserdDetailModule(with user: User) -> UIViewController
}

class Builder: ModuleBuilder {
    
    static func createUsersModule() -> UIViewController {
        let view = UsersViewController()
        let networkService = NetworkService()
        let presenter = UserMainPresenter(
            view: view,
            networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createUserdDetailModule(with user: User) -> UIViewController {
        let view = UserDetailViewController()
        let networkService = NetworkService()
        let presenter = UserDetailPresener(
            view: view,
            networkService: networkService,
            user: user)
        view.presenter = presenter
        return view
    }
}
