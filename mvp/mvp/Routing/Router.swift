//
//  Router.swift
//  mvp
//
//  Created by Дмитрий Цветков on 27.07.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assebleBuilder: BuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initiateViewController()
    func showSecond()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assebleBuilder: BuilderProtocol?
    
    init(navigationController: UINavigationController, assebleBuilder: BuilderProtocol) {
        self.navigationController = navigationController
        self.assebleBuilder = assebleBuilder
    }
    
    func initiateViewController() {
        if let navigationController = navigationController {
            guard let mainVC = assebleBuilder?.createMain(router: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func showSecond() {
        if let navigationController = navigationController {
            guard let secondVC = assebleBuilder?.createSecond(router: self) else { return }
            navigationController.pushViewController(secondVC, animated: true)
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailVC = assebleBuilder?.createDetail(comment: comment, router: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    

    
    
}
