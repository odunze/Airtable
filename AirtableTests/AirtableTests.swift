//
//  AirtableTests.swift
//  AirtableTests
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import XCTest
@testable import Airtable

class AirtableTests: XCTestCase {
    
    var vm: TimelineViewmodel!
    var vc: TimelineViewController!
    var cell: ItemCell!
    var testIndex: IndexPath!

    override func setUp() {
        super.setUp()
        vm = TimelineViewmodel()
        vc = TimelineViewController()
        testIndex = IndexPath(row: 8, section: 0)
        vc.dataTable.register(ItemCell.self, forCellReuseIdentifier: vc.cellIdentifier)
        vc.viewWillAppear(true)
        cell = vc.tableView(vc.dataTable, cellForRowAt: testIndex) as! ItemCell
    }
    
    override func tearDown() {
        super.tearDown()
        vc = nil
        vm = nil
        cell = nil
        testIndex = nil
    }
        
    
    func testSetsData() { //Test that it sets the data.
        XCTAssertNotNil(vc.items)
        XCTAssertEqual(vm.sortedItems.first?.name, vc.items?.first?.name)
    }
    
    func testDataSort() { //Test that the data is sorted correctly.
        XCTAssertEqual(vc.items?.first?.id, 7)
        XCTAssertEqual(vc.items?.last?.id, 4)
    }
    
    func testLoadsLogo() { //Test that it loads the logo.
        XCTAssertEqual(vc.logo.image, UIImage(named: "airtable"))
    }
    
    func testTableview() { //Test that it creates the tableview.
        XCTAssertNotNil(vc.dataTable)
        
        //Test that it loads the correct number of rows.
        XCTAssertEqual(vc.dataTable.numberOfRows(inSection: 0), vm.sortedItems.count)
    }
    
    func testTableCell() { //Test that it creates the custom cell.
        XCTAssertNotNil(cell)
    }
    
    func testDateDisplay() { //Test that it displays the dates.
        let start = cell.prettyDate(date: vm.sortedItems[testIndex.row].startDate!)
        let end = cell.prettyDate(date: vm.sortedItems[testIndex.row].endDate!)
        
        //It displays the start date
        XCTAssertEqual(cell.startLabel.text, start)
        
        //It displays the end date
        XCTAssertEqual(cell.endLabel.text, end)
    }
    
    func testDivider() { //Test that it displays the divider.
        XCTAssertNotNil(cell.divider)
    }
    
    func testContent() { //Test that it displays the content.
        XCTAssertEqual(cell.contentLabel.text, vm.sortedItems[testIndex.row].name)
    }
}
