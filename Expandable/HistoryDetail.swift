//
//  HistoryDetail.swift
//  Expandable
//
//  Created by Kamil Szczepański on 10/03/2017.
//  Copyright © 2017 Appcoda. All rights reserved.
//

import UIKit

class HistoryDetail: NSObject {
    var products: [String] = []
    var number: String
    
    var isExpanded: Bool

    init(number: String) {
        self.number = number
        self.isExpanded = false
    }
}
