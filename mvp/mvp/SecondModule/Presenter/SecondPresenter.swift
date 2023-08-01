//
//  SecondPresenter.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import Foundation

protocol SecondViewProtocol: AnyObject {
    func success()
    func fail(error: Error)
}

protocol SecondViewPresenterProtocol: AnyObject {
    init(view: SecondViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    
    func tabOnComment(comment: Comment?)
}

class SecondPresenter: SecondViewPresenterProtocol {
    weak var view: SecondViewProtocol?
    var networkManager: NetworkManagerProtocol?
    var comments: [Comment]?
    var router: RouterProtocol?
    
    required init(view: SecondViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
    }
    
    func getComments() {
        networkManager?.getComments(completion: { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.fail(error: error)
                }
            }
        })
    }
    
    func tabOnComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
}
