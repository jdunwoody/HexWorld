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
}


//class var flyingEnabled : Bool {
//    get {
//        if let flyingEnabled = NSUserDefaults.standardUserDefaults().objectForKey("flying_enabled_preference") as Bool? {
//            return flyingEnabled
//        }
//        return false
//    }
//}
//
//class var initialNumberOfBirds : Int {
//    get {
//        if let numberOfBirds = NSUserDefaults.standardUserDefaults().objectForKey("number_of_birds_preference") as Int? {
//            return numberOfBirds
//        }
//        return 3
//    }
//
//}
//
//class var showWalls : Bool {
//    get {
//        if let showWalls = NSUserDefaults.standardUserDefaults().objectForKey("show_walls_preference") as Bool? {
//            return showWalls
//        }
//        return false
//
//    }
//}
//
//class var showObstacles : Bool {
//    get {
//        if let showObstacles = NSUserDefaults.standardUserDefaults().objectForKey("show_obstacles_preference") as Bool? {
//            return showObstacles
//        }
//        return false
//
//    }
//}
//
//class var showSteeringForce : Bool {
//    get {
//        if let showSteeringForce = NSUserDefaults.standardUserDefaults().objectForKey("show_steering_force_preference") as Bool? {
//            return showSteeringForce
//        }
//        return false
//
//    }
//}
//
//class var showFeelers : Bool {
//    get {
//        if let showFeelers = NSUserDefaults.standardUserDefaults().objectForKey("show_feelers_preference") as Bool? {
//            return showFeelers
//        }
//        return false
//
//    }
//}
//
//class var showDetectionBox : Bool {
//    get {
//        if let showDetectionBox = NSUserDefaults.standardUserDefaults().objectForKey("show_detection_box_preference") as Bool? {
//            return showDetectionBox
//        }
//        return false
//
//    }
//}
