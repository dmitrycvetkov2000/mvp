//
//  DetailPresenter.swift
//  mvp
//
//  Created by Дмитрий Цветков on 26.07.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComments(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comment: Comment?)
    func setComments()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    var networkManager: NetworkManagerProtocol
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comment: Comment?) {
        self.view = view
        self.networkManager = networkManager
        self.comment = comment
    }
    
    func setComments() {
        view?.setComments(comment: comment)
    }
}
