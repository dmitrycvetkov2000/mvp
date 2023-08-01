//
//  TableViewCell.swift
//  mvp
//
//  Created by Дмитрий Цветков on 25.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "Cell"
    let labelForTable = UILabel()
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        //createLabelForTable()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

extension TableViewCell {
    func createLabelForTable(text: String) {
        labelForTable.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelForTable)
        
        NSLayoutConstraint.activate([
            labelForTable.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            labelForTable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            labelForTable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            labelForTable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        labelForTable.textColor = .black
        labelForTable.text = text
    }
}
