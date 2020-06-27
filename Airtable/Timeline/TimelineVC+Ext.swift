//
//  TimelineVC+Ext.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

extension TimelineViewController:  UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemCell
        
        guard let item = items?[indexPath.row] else { return cell }
        
        cell.contentLabel.text = item.name
        
        if let startDate = item.startDate { cell.startLabel.text = cell.prettyDate(date: startDate) }
        if let endDate = item.endDate { cell.endLabel.text = cell.prettyDate(date: endDate) }

        return cell
    }
}
