//
//  ModuleBuilder.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import UIKit

//typealias NavigationFactory = (UIViewController) -> (UINavigationController)

//class NavigationBuilder {
//        func build(root: UIViewController) -> UINavigationController {
//        let navigationController = UINavigationController(rootViewController: root)
//        navigationController.modalPresentationStyle = .fullScreen
//        return navigationController
//    }
//}

protocol BuilderProtocol: AnyObject {
    func createMain(router: RouterProtocol) -> UIViewController
    func createSecond(router: RouterProtocol) -> UIViewController
    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let model = Person(firstName: "Dmitry", lastName: "Tsvetkov")
        let presenter = MainPresenter(view: view, person: model, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createSecond(router: RouterProtocol) -> UIViewController {
        let view = SecondVC()
        let networkManager = NetworkManager()
        let presenter = SecondPresenter(view: view, networkManager: networkManager, router: router)
        let helper = Helper()
        view.helper = helper
        view.presenter = presenter
        
        return view
    }
    
    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailVC()
        let networkManager = NetworkManager()
        let presenter = DetailPresenter(view: view, networkManager: networkManager, comment: comment)
        view.presenter = presenter
        
        return view
    }
}
