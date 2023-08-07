//
//  CustomCell.swift
//  3.2_homework
//
//  Created by Artem Ryabichev on 07.08.2023.
//

import UIKit

class CustomCell: UITableViewCell {
    
    private let vStack = UIStackView()
    private let hStack = UIStackView()
    let content = UILabel()
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCustomCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomCell() {
        self.contentView.addSubview(hStack)
        
        title.numberOfLines = 0
        title.textAlignment = .center
        vStack.axis = .vertical
        vStack.addArrangedSubview(title)
        
        hStack.axis = .horizontal
        hStack.spacing = 40
        content.numberOfLines = 0
        hStack.addArrangedSubview(vStack)
        hStack.addArrangedSubview(content)
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            vStack.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
}
