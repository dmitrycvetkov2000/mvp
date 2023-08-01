//
//  MainModuleTests.swift
//  mvpTests
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import XCTest
@testable import mvp

class MockMainView: MainViewProtocol {
    var greeting: String?
    func setGreeting(greeting: String) {
        self.greeting = greeting
    }
}

final class MainModuleTests: XCTestCase {
    var view: MockMainView!
    var model: Person!
    var router: RouterProtocol!
    var presenter: MainPresenter!
    
    override func setUpWithError() throws {
        view = MockMainView()
        model = Person(firstName: "Fir", lastName: "Sec")
        router = Router(navigationController: UINavigationController(), assebleBuilder: ModuleBuilder())
        presenter = MainPresenter(view: view, person: model, router: router)
    }

    override func tearDownWithError() throws {
        view = nil
        model = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view)
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.greeting, "Fir Sec")
    }
    
    func testModel() {
        XCTAssertEqual(model.firstName, "Fir")
        XCTAssertEqual(model.lastName, "Sec")
    }
}
