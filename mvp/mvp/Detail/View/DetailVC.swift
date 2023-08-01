//
//  DetailVC.swift
//  mvp
//
//  Created by Дмитрий Цветков on 26.07.2023.
//

import UIKit

class DetailVC: UIViewController {
    let label = UILabel()
    var presenter: DetailViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        presenter?.setComments()
        view.backgroundColor = .white
    }
}

extension DetailVC: DetailViewProtocol {
    func setComments(comment: Comment?) {
        label.text = comment?.body
    }
    
    func createLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
        label.numberOfLines = 0
    }
}
