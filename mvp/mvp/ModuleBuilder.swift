//
//  ModuleBuilder.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    static func build(root: UIViewController) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: root)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
}

protocol Builder: AnyObject {
    static func createMain(factory: Bool) -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMain(factory: Bool) -> UIViewController {
        let view = MainViewController()
        let model = Person(firstName: "Dmitry", lastName: "Tsvetkov")
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        if factory {
            return NavigationBuilder.build(root: view)
        } else {
            return view
        }
    }
}
