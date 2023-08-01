//
//  MainPresenter.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person, router: RouterProtocol)
    func showGreeting()
    func showSecond()
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let person: Person
    var router: RouterProtocol?
    
    required init(view: MainViewProtocol, person: Person, router: RouterProtocol) {
        self.view = view
        self.person = person
        self.router = router
    }
    
    func showGreeting() {
        let greet = person.firstName + " " + person.lastName
        self.view?.setGreeting(greeting: greet)
    }
    
    func showSecond() {
        router?.showSecond()
    }
}
