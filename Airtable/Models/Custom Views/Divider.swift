//
//  Backdrop.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class Divider: UIView {

    lazy var upper = Connector(frame: .zero)
    lazy var circle = Marker(frame: .zero)
    lazy var lower = Connector(frame: .zero)
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        
        //Upper
        upper.bottomAnchor.constraint(equalTo: circle.topAnchor).isActive = true
        upper.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        upper.heightAnchor.constraint(equalToConstant: 60).isActive = true
        upper.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
        //Circle
        circle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 24).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        //Lower
        lower.topAnchor.constraint(equalTo: circle.bottomAnchor).isActive = true
        lower.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lower.heightAnchor.constraint(equalToConstant: 60).isActive = true
        lower.widthAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(upper)
        addSubview(circle)
        addSubview(lower)
    
        setNeedsLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
