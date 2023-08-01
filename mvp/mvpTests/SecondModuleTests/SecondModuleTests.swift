//
//  SecondModuleTests.swift
//  mvpTests
//
//  Created by Дмитрий Цветков on 01.08.2023.
//

import XCTest
@testable import mvp

class MockSecondView: SecondViewProtocol {
    func success() {
        
    }
    
    func fail(error: Error) {
        
    }
}

private class MockNetworkManager: NetworkManagerProtocol {
    var comments: [Comment]!
    
    init() {}
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[mvp.Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0)
            completion(.failure(error))
        }
    }
}

final class SecondModuleTests: XCTestCase {
    var view: MockSecondView!
    var router: RouterProtocol!
    var presenter: SecondPresenter!
    var comments = [Comment]()
    var networkManager: NetworkManagerProtocol!
    
    override func setUpWithError() throws {
        let navVC = UINavigationController()
        let assebleBuilder = ModuleBuilder()
        router = Router(navigationController: navVC, assebleBuilder: assebleBuilder)
    }

    override func tearDownWithError() throws {
        view = nil
        networkManager = nil
        presenter = nil
    }

    func testGetSuccessComment() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockSecondView()
        networkManager = MockNetworkManager(comments: comments)
        presenter = SecondPresenter(view: view, networkManager: networkManager, router: router)
        
        var catchComments: [Comment]?
        
        networkManager.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(catchComments?.count, comments.count)
    }
    
    func testGetFailtureComment() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockSecondView()
        networkManager = MockNetworkManager()
        presenter = SecondPresenter(view: view, networkManager: networkManager, router: router)
        
        var catchError: Error?
        
        networkManager.getComments { result in
            switch result {
            case .success(let comments):
                print(comments ?? [Comment]())
            case .failure(let error):
                catchError = error
            }
        }
        
        XCTAssertNotNil(catchError)
    }
}
