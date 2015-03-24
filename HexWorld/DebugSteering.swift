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
