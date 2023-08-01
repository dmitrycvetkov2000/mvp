//
//  ViewController.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    let label = UILabel()
    let button = UIButton()
    let buttonNext = UIButton()
    var presenter: MainViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        createLabel()
        createButton()
        createButtonNext()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.label.text = greeting
    }
}

// MARK: - create views
extension MainViewController {
    func createLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        label.text = "Name"
    }
    
    func createButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .black
        
        button.addTarget(self, action: #selector(showTextLabel), for: .touchUpInside)
    }
    @objc func showTextLabel() {
        presenter?.showGreeting()
    }
    
    func createButtonNext() {
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonNext)
        
        NSLayoutConstraint.activate([
            buttonNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonNext.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            buttonNext.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            buttonNext.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.setTitle("NextScreen", for: .normal)
        buttonNext.backgroundColor = .black
        
        buttonNext.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    @objc func goNext() {
        presenter?.showSecond()
    }
}
