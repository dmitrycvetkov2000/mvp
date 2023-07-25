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
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greet = person.firstName + " " + person.lastName
        self.view.setGreeting(greeting: greet)
    }
}
