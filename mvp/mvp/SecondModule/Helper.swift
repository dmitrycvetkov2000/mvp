//
//  Helper.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import UIKit

class Helper: NSObject {
    weak var viewController: SecondViewProtocol?
    var presenter: SecondViewPresenterProtocol?
}

extension Helper: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let comment = presenter?.comments?[indexPath.row]
        if let comment = comment {
            cell.createLabelForTable(text: comment.body)
        } else {
            cell.createLabelForTable(text: "b")
        }
        return cell
    }
}

extension Helper: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter?.comments?[indexPath.row]
        presenter?.tabOnComment(comment: comment)
    }
}
