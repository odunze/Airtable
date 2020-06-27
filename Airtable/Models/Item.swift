//
//  Item.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import Foundation

struct Item: Codable {
    var id: Int
    var start: String
    var end: String
    var name: String
    var startDate: Date?
    var endDate: Date?
}
