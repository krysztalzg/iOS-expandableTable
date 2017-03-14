//
//  NormalCell.swift
//  Expandable
//
//  Created by Kamil Szczepański on 14/03/2017.
//  Copyright © 2017 Appcoda. All rights reserved.
//

import UIKit

class NormalCell: UITableViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        background.layer.cornerRadius = 5
        background.layer.shadowOffset = CGSize(width: 0, height: 5)
        background.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        background.layer.shadowOpacity = 1.0
        background.layer.shadowRadius = 5
        background.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
