//
//  Debug.swift
//  CrowControls
//
//  Created by James Dunwoody on 12/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import SpriteKit

class Debug: SKShapeNode {
    //    let bezierPath = UIBezierPath()
    //    var controlPoint1 :Vector2D
    //    var controlPoint2 :Vector2D
    //    var point1 :Vector2D
    //    var point2 :Vector2D
    let bird: Bird
    let steering: Steering

    let colours = [SKColor.blueColor(), SKColor.redColor(), SKColor.purpleColor(), SKColor.blackColor(), SKColor.greenColor(), SKColor.orangeColor(), SKColor.brownColor()]
    var currentColour = 0

    var debugForces: [DebugForce]

    init(bird: Bird, steering: Steering) {
        self.bird = bird
        self.steering = steering
        self.debugForces = []

        super.init()
    }

    func nextColour() -> SKColor {
        return colours[currentColour++ % colours.count]
    }

    func configure() {
        debugForces = steering.forces.map({ force in DebugForce(bird: self.bird, force: force, color: self.nextColour()) })
    }

    required init?(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    func update() {
        for debugForce in debugForces {
            debugForce.update()
        }
    }

}
