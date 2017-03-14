//
//  ViewController.swift
//  Expandable
//
//  Created by Gabriel Theodoropoulos on 28/10/15.
//  Copyright © 2015 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var documents: [HistoryDetail] = []
    var cells: [NSDictionary] = []
    
    @IBOutlet weak var tblExpandable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MOCKUP
        for i in 0...4{
            documents.append(HistoryDetail(number: "Document #\(i)"))
            for _ in 0...i {
                documents[i].products.append("\(i)")
            }
        }
        documents[1].isExpanded = true
        documents[3].isExpanded = true
        // MOCKUP
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTableView()
        prepareToShow()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func configureTableView() {
        tblExpandable.delegate = self
        tblExpandable.dataSource = self
        tblExpandable.tableFooterView = UIView(frame: CGRect.zero)
        
        tblExpandable.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "normalCell")
        tblExpandable.register(UINib(nibName: "ProductsCell", bundle: nil), forCellReuseIdentifier: "productsCell")
        tblExpandable.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: "expandedCell")
    }
    
    func prepareToShow() {
        cells = []
        
        for i in 0..<documents.count {
            if documents[i].isExpanded {
                cells.append(["id":"expandedCell", "number": i])
            } else {
                cells.append(["id":"normalCell", "number": i])
            }
            if documents[i].isExpanded {
                cells.append(["id":"productsCell", "number": i])
            }
        }
    }
    
    // MARK: Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentDocument = cells[indexPath.row].value(forKey: "number") as! Int
        let currentId = cells[indexPath.row].value(forKey: "id") as! String
        var cell = UITableViewCell()
        
        switch currentId {
        case "normalCell":
            let normalCell = tableView.dequeueReusableCell(withIdentifier: currentId, for: indexPath) as! NormalCell
            
            normalCell.label.text = documents[currentDocument].number
            cell = normalCell
        case "productsCell":
            let productsCell = tableView.dequeueReusableCell(withIdentifier: currentId, for: indexPath) as! ProductsCell
            
            productsCell.productsCount = documents[currentDocument].products.count
            productsCell.table.reloadData()
            cell = productsCell
        case "expandedCell":
            let expandedCell = tableView.dequeueReusableCell(withIdentifier: currentId, for: indexPath) as! ExpandedCell
            
            expandedCell.label.text = documents[currentDocument].number
            cell = expandedCell
        default:
            break
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentId = cells[indexPath.row].value(forKey: "id") as! String
        let documentNo = cells[indexPath.row].value(forKey: "number") as! Int
        
        switch currentId {
        case "normalCell", "expandedCell":
            return 100.0
        case "productsCell":
            let productsCount = CGFloat(documents[documentNo].products.count)
            return productsCount * 175
        default:
            return 60
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentDocument = cells[indexPath.row].value(forKey: "number") as! Int
        let currentId = cells[indexPath.row].value(forKey: "id") as! String
        
        switch currentId {
        case "normalCell":
            documents[currentDocument].isExpanded = true
            prepareToShow()
        case "productsCell":
            break
        case "expandedCell":
            documents[currentDocument].isExpanded = false
            prepareToShow()
        default:
            break
        }
        tblExpandable.reloadData()
    }
}

