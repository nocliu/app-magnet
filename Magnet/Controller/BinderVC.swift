//
//  BinderVC.swift
//  Magnet
//
//  Created by Connie Liu on 7/15/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class BinderVC: UIViewController {
    
    @IBOutlet weak var tabTable: UITableView!
    @IBOutlet weak var newTabButton: UIButton!
    
    var tabs: [Tab] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTabButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        
        tabs = createTabArray()
        
        tabTable.delegate = self
        tabTable.dataSource = self
    }
    
    func createTabArray() -> [Tab] {
        var tempTabs: [Tab] = []
        
        let tab1 = Tab(title: "1st period")
        tempTabs.append(tab1)
        let tab2 = Tab(title: "2nd period")
        tempTabs.append(tab2)
        let tab3 = Tab(title: "3rd period")
        tempTabs.append(tab3)
        let tab4 = Tab(title: "4th period")
        tempTabs.append(tab4)
        
        return tempTabs
    }
    
    @IBAction func newTabButtonPressed(_ sender: Any) {
    }
    
    func createNewTab(tabLabel: String) {
//        let newTab = Tab(title: tabLabel)
//        tabs.insert(newTab, at: tabs.count-1)
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension BinderVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tab = tabs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TabCell") as! TabCell
        
        cell.setTab(tab: tab)
        return cell
    }
}
