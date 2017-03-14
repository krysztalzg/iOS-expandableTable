//
//  ProductsCell.swift
//  Expandable
//
//  Created by Kamil Szczepański on 14/03/2017.
//  Copyright © 2017 Appcoda. All rights reserved.
//

import UIKit

class ProductsCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var productsCount: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        background.layer.cornerRadius = 5
        background.layer.shadowOffset = CGSize(width: 0, height: 5)
        background.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        background.layer.shadowOpacity = 1.0
        background.layer.shadowRadius = 5
        background.layer.masksToBounds = false
        
        table.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        table.delegate = self
        table.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Table view
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableCell
        
        return cell
    }
}
