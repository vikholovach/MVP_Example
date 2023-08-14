//
//  CommentsMainPresenter.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import Foundation

protocol CommentsViewProtocol: AnyObject {
    func onSuccess()
    func onError(with error: Error)
}

protocol CommentsViewPresenterProtocol: AnyObject {
    
    init(view: CommentsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    
    var comments: [Comment]? {get set}
    
    func fetchComments()
}

class CommentsPresenter: CommentsViewPresenterProtocol {
    var comments: [Comment]?
    
    weak var view: CommentsViewProtocol?
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    
    required init(view: CommentsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    
    
    func fetchComments() {
        Task { [weak self] in
            guard let self = self else {return}
            let response = await self.networkService.fetchComments()
            DispatchQueue.main.async {
                switch response {
                case .success(let comments):
                    self.comments = comments
                    self.view?.onSuccess()
                case .failure(let error):
                    self.view?.onError(with: error)
                }
            }
        }
        
    }
    
    
    
    
}
