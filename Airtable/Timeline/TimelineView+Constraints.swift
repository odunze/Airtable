//
//  TimelineView+Constraints.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import Foundation

extension TimelineViewController {
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        //Header and Title
        header.heightAnchor.constraint(equalToConstant: 200).isActive = true
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        //Logo
        logo.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        
        //Tableview
        dataTable.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        dataTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dataTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        dataTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
