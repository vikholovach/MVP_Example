//
//  ModuleBuilder.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 10.08.2023.
//

import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    func createUsersModule(with router: RouterProtocol) -> UIViewController
    func createUserdDetailModule(with router: RouterProtocol, and user: User? ) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol  {
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
}
