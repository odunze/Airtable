//
//  TimelineViewController.swift
//  Airtable
//
//  Created by Lotanna Igwe-Odunze on 11/1/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    var vm = TimelineViewmodel()
    
    var items: [Item]?
    
    var cellIdentifier = "itemCell"
    
    lazy var header: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0/255, green: 117/255, blue: 242/255, alpha: 1.0)
        return view
    }()
    
    var logo: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "airtable")
        return view
    }()
    
    var dataTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        items = vm.sortedItems
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        dataTable.dataSource = self
        dataTable.delegate = self
        dataTable.allowsSelection = false
        dataTable.separatorColor = .clear
        dataTable.rowHeight = 140
        dataTable.register(ItemCell.self, forCellReuseIdentifier: cellIdentifier)
        
        header.addSubview(logo)
        view.addSubview(header)
        view.addSubview(dataTable)
        
        updateViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
