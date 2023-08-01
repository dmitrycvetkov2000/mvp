//
//  RouterTest.swift
//  mvpTests
//
//  Created by Дмитрий Цветков on 01.08.2023.
//

import XCTest
@testable import mvp

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let builder = ModuleBuilder()
    
    
    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assebleBuilder: builder)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigationController.presentedVC
        
        XCTAssertTrue(detailVC is DetailVC)
    }
}
