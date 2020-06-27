//
//  Marker.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class Marker: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let airblue = UIColor(red: 0/255, green: 117/255, blue: 242/255, alpha: 1.0)
        
        layer.cornerRadius = 12.0
        layer.borderColor = airblue.cgColor
        layer.borderWidth = 5.0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
