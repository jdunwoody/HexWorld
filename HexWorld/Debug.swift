//
//  Debug.swift
//  CrowControls
//
//  Created by James Dunwoody on 12/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import SpriteKit

class Debug: SKShapeNode {
    var bird: Bird?
    let steering: Steering


    var debugForces: [DebugForce]

    init(steering: Steering, bird: Bird) {
        self.steering = steering
        self.debugForces = []
        self.bird = bird
        self.debugForces = steering.forces.map({
            force in
            let colours = [SKColor.blueColor(), SKColor.redColor(), SKColor.purpleColor(), SKColor.blackColor(), SKColor.greenColor(), SKColor.orangeColor(), SKColor.brownColor()]
            var currentColour = 0
            return DebugForce(bird: bird, force: force, color: colours[currentColour++ % colours.count]);
        })

        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    func remove() {
        for debugForce in debugForces {
            debugForce.remove()
        }
    }

//    func nextColour() -> SKColor {
//        return colours[currentColour++ % colours.count]
//    }

    func update() {
        if debugForces.isEmpty {
            return
        }

        let x = debugForces[0].bird.sprite.position.x
        var y: CGFloat = debugForces[0].bird.sprite.position.y
        var height: CGFloat = 12.0

        for debugForce in debugForces {
            debugForce.update()
            debugForce.label.position = CGPoint(x: x, y: y + height)
            y += height
        }
    }
}
