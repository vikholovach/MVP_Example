//
//  UserDetailPresenter.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import Foundation

protocol UserDetailViewProtocol: AnyObject {
    func showUser(with user: User?)
}

protocol UserDetailViewPresenterProtocol: AnyObject {
    init(view: UserDetailViewProtocol, networkService: NetworkServiceProtocol, user: User?, router: RouterProtocol)
    func prepareUser()
    func onBackAction()
}

class UserDetailPresener: UserDetailViewPresenterProtocol {
    weak var view: UserDetailViewProtocol?
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var user: User?
    
    required init(view: UserDetailViewProtocol, networkService: NetworkServiceProtocol, user: User?, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.user = user
        self.router = router
    }
    
    func prepareUser() {
        self.view?.showUser(with: user)
    }
    
    func onBackAction() {
        self.router?.popToRoot()
    }
}
