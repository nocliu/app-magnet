//
//  UserTabService.swift
//  Magnet
//
//  Created by Connie Liu on 7/28/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import Foundation

class UserTabService {
    
    static let instance = UserTabService()
    
    var tabsArray: [Tab] = []
    
    func createNewTab(newTab: Tab) {
        tabsArray.append(newTab)
    }
    
}
