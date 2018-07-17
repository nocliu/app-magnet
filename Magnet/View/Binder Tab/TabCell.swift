//
//  TabCell.swift
//  Magnet
//
//  Created by Connie Liu on 7/15/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class TabCell: UITableViewCell {

    @IBOutlet weak var tabButton: UIButton!
    @IBOutlet weak var tabLabel: UILabel!
    
    func setTab(tab: Tab) {
        tabLabel.text = tab.title
        tabLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        tabButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
    }

    @IBAction func tabButtonPressed(_ sender: Any) {
        print("\(whichTabButton(tabText: tabLabel.text!))")
    }
    
    func whichTabButton(tabText: String) -> String {
        return tabLabel.text!
    }
    
}
