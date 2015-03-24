//
//  Setting.swift
//  HexWorld
//
//  Created by James Dunwoody on 8/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import UIKit

class Setting: NSObject {

    let name: NSString

    init(name: NSString) {
        self.name = name
    }

    var enabled: Bool {
        if let value = NSUserDefaults.standardUserDefaults().objectForKey(name) as Bool? {
            return value
        }
        return false
    }

    var intValue: Int {
        if let value = NSUserDefaults.standardUserDefaults().objectForKey(name) as Int? {
            return value
        }
        return 1
    }
}
