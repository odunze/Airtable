//
//  ItemCell.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    var divider = Divider()
    var startLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    var endTagLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.text = "ENDS:"
        label.textColor = .white
        return label
    }()
    
    lazy var endTag: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 3.0
        view.addSubview(endTagLabel)
        return view
    }()
    
    var endLabel = UILabel(frame: .zero)
    
    lazy var endStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.spacing = 10
        stack.addArrangedSubview(endTag)
        stack.addArrangedSubview(endLabel)
        return stack
    }()
    
    lazy var container: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.addArrangedSubview(contentLabel)
        stack.addArrangedSubview(endStack)
        return stack
    }()
    
    func prettyDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM DD, YYYY"
        
        let prettyDate = dateFormatter.string(from: date)
        return prettyDate
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(startLabel)
        contentView.addSubview(divider)
        contentView.addSubview(container)
        
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        //StartDate
        startLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        startLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        startLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
        
        //Divider
        divider.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        divider.leftAnchor.constraint(equalTo: startLabel.rightAnchor, constant: 20).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 140).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        //Content
        container.heightAnchor.constraint(equalToConstant: 80).isActive = true
        container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: divider.rightAnchor, constant: 18).isActive = true
        container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 18).isActive = true
        
        //EndTag
        endTag.widthAnchor.constraint(equalToConstant: 50).isActive =  true
        endTagLabel.centerXAnchor.constraint(equalTo: endTag.centerXAnchor).isActive = true
        endTagLabel.centerYAnchor.constraint(equalTo: endTag.centerYAnchor).isActive = true
    }
}
