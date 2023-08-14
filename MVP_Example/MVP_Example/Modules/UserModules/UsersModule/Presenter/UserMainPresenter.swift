//
//  MainPresenter.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 10.08.2023.
//

import Foundation

protocol UserViewProtocol: AnyObject {
    func onSuccess()
    func onFailure(with error: String)
}

protocol UserViewPresenterProtocol: AnyObject {
    init(view: UserViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var users: [User]? {get set}
    
    func onUserDescriptionAction(with user: User?)
    func fetchUsers()
}

class UserMainPresenter: UserViewPresenterProtocol {
    weak var view: UserViewProtocol?
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var users: [User]?
    
    required init(view: UserViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        fetchUsers()
    }
    
    func fetchUsers() {
        Task { [weak self] in
            guard let self = self else {return}
            guard let result = await self.networkService?.fetchUsers() else {
                self.view?.onFailure(with: "Unable to get result")
                return
            }
            DispatchQueue.main.async { 
                switch result {
                case .success(let users):
                    self.users = users
                    self.view?.onSuccess()
                case .failure(let error):
                    self.view?.onFailure(with: error.localizedDescription)
                }
            }
            
        }
    }
    
    func onUserDescriptionAction(with user: User?) {
        router?.showUserDetail(with: user)
    }
    
    
}
