//
//  Settings.swift
//  CrowControls
//
//  Created by James Dunwoody on 27/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import UIKit

class Settings {

    let data: [Setting]

    init() {
        data = [
                Setting(name: "flying_enabled_preference"),
                Setting(name: "number_of_birds_preference"),
                Setting(name: "debugging_info_enabled"),
                Setting(name: "wallAvoidance"),
                Setting(name: "obstacleAvoidance"),
                Setting(name: "separation"),
                Setting(name: "seek"),
                Setting(name: "cohesion"),
        ]
    }

    func size() -> Int {
        return data.count
    }

    subscript(name: String) -> Setting? {
        for setting in data {
            if setting.name == name {
                return setting
            }
        }
        return nil
    }

    subscript(index: Int) -> Setting? {
        return data[index]
    }

    class var flyingEnabled: Bool {
        get {
            if let flyingEnabled = NSUserDefaults.standardUserDefaults().objectForKey("flying_enabled_preference") as Bool? {
                return flyingEnabled
            }
            return false
        }
    }

    class var numberOfBirds: Int {
        get {
            let def = NSUserDefaults.standardUserDefaults()

            if let numberOfBirds = NSUserDefaults.standardUserDefaults().objectForKey("number_of_birds_preference") as Int? {
                return numberOfBirds
            }
            return 1
        }
    }

    class var debuggingInfoEnabled: Bool {
        get {
            if let showDetectionBox = NSUserDefaults.standardUserDefaults().objectForKey("debugging_info_enabled") as Bool? {
                return showDetectionBox
            }
            return false

        }
    }
}
