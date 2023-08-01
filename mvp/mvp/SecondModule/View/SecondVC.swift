//
//  SecondVC.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import UIKit

class SecondVC: UIViewController {
    var presenter: SecondViewPresenterProtocol?
    var helper: Helper?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = helper
        tableView.delegate = helper
        helper?.presenter = presenter
        helper?.viewController = self
        view.backgroundColor = .white
        presenter?.getComments()
    }
}

extension SecondVC: SecondViewProtocol {

    
//    func showDetail(vc: DetailViewProtocol) {
//        navigationController?.pushViewController(vc as! UIViewController, animated: true)
//    }
    
    func success() {
        tableView.reloadData()
    }
    
    func fail(error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - create views
extension SecondVC {
    func createTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
