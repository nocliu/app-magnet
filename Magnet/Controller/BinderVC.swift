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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTabButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        
        tabTable.delegate = self
        tabTable.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(BinderVC.updateTable(_:)), name: NOTIF_NEW_TAB_CREATED, object: nil)
    }
    
    @IBAction func newTabButtonPressed(_ sender: Any) {
        let newTab = NewTabVC()
        newTab.modalPresentationStyle = .custom
        present(newTab, animated: true, completion: nil)
    }
    
    @objc func updateTable(_ notif: Notification) {
        tabTable.beginUpdates()
        tabTable.insertRows(at: [NSIndexPath(row: UserTabService.instance.tabsArray.count-1, section: 0) as IndexPath], with: .automatic)
        tabTable.endUpdates()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension BinderVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserTabService.instance.tabsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tab = UserTabService.instance.tabsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TabCell") as! TabCell
        
        cell.setTab(tab: tab)
        return cell
    }
}
