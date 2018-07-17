//
//  BinderVC.swift
//  Magnet
//
//  Created by Connie Liu on 7/15/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class BinderVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tabs: [Tab] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabs = createTabArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createTabArray() -> [Tab] {
        var tempTabs: [Tab] = []
        
        let tab1 = Tab(title: "1st period")
        tempTabs.append(tab1)
        let tab2 = Tab(title: "2nd period")
        tempTabs.append(tab2)
        let tab3 = Tab(title: "3rd period")
        tempTabs.append(tab3)
        
        let newTab = Tab(title: "+ New Tab")
        tempTabs.append(newTab)
        
        return tempTabs
    }
    
    func createNewTab(tabLabel: String) {
        let newTab = Tab(title: tabLabel)
        tabs.insert(newTab, at: tabs.count-2)
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
