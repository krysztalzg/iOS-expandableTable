//
//  TableCell.swift
//  Expandable
//
//  Created by Kamil Szczepański on 13/03/2017.
//  Copyright © 2017 Appcoda. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
//    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
