//
//  DebugSteering.swift
//  CrowControls
//
//  Created by James Dunwoody on 2/01/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import Foundation
import SpriteKit

class DebugSteering {
//    class var sharedInstance:DebugSteering {
//        struct Singleton {
//            static let instance = DebugSteering()
//        }
//        return Singleton.instance
//    }

    var centreOfMass: CGPoint = CGPoint() {
        didSet {
            sprite.position = centreOfMass
        }
    }
    let sprite: SKShapeNode

    init() {
        sprite = SKShapeNode(circleOfRadius: 10.0)

        sprite.lineWidth = 1.0
        sprite.fillColor = SKColor.blueColor()
        sprite.strokeColor = SKColor.whiteColor()
        sprite.glowWidth = 0.5
        sprite.alpha = 0.3
    }
}


//
//    func updatePoint2(change :Vector2D)
//    {
//        self.point2 = Vector2D(x: point1.x + change.x, y: point1.y + 200.0 + change.y)
//    }
//
//    func updatePath()
//    {
//        //        bezierPath.moveToPoint(point1.point)
//        //        bezierPath.addCurveToPoint(point2.point, controlPoint1: controlPoint1.point, controlPoint2: controlPoint2.point)
//        //        self.path = bezierPath.CGPath
//        //        bezierPath.removeAllPoints()
//    }
