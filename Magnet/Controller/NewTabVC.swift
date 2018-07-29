//
//  NewTabVC.swift
//  Magnet
//
//  Created by Connie Liu on 7/28/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class NewTabVC: UIViewController {

    @IBOutlet weak var tabTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabTxt.becomeFirstResponder()
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createNewTabButtonPressed(_ sender: Any) {
        guard let tabTitle = tabTxt.text else { return }
        let newTab = Tab(title: tabTitle)
        UserTabService.instance.createNewTab(newTab: newTab)
        
        NotificationCenter.default.post(name: NOTIF_NEW_TAB_CREATED, object: nil)
        
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
}
