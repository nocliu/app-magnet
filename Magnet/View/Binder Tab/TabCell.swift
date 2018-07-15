//
//  TabCell.swift
//  Magnet
//
//  Created by Connie Liu on 7/15/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class TabCell: UITableViewCell {

    @IBOutlet weak var tabTitle: UILabel!
    
    func setTab(tab: Tab) {
        tabTitle.text = tab.title
        tabTitle.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
    }

}
