//
//  TimelineViewmodel.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class TimelineViewmodel {
    
    var sortedItems: [Item] = []
    
    init() {
        sortItems()
    }
    
    func loadData(completion: ([Item]) ->()) {
        
        if let url = Bundle.main.url(forResource: "timeline-data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Item].self, from: data)
                
                completion(decodedData)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func sortItems() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        
        loadData { (data) in
            for datum in data {
                
                if let startDate = dateFormatter.date(from: datum.start), let endDate = dateFormatter.date(from: datum.end) {
                    let item = Item(id: datum.id, start: datum.start, end: datum.end, name: datum.name, startDate: startDate, endDate: endDate)
                    sortedItems.append(item)
                }
            }
            
            sortedItems.sort(by: {
                $0.endDate!.compare($1.endDate!) == .orderedAscending
            })
            
            sortedItems.sort(by: {
                $0.startDate!.compare($1.startDate!) == .orderedAscending
            })
        }
    }
}
