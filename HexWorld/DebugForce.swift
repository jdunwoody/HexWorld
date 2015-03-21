//
//  Created by James Dunwoody on 1/01/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import Foundation
import SpriteKit

class DebugForce {
    let sprite: SKShapeNode
    let label: SKLabelNode

    let force: Force
    let TIME_INTERVAL: CGFloat = 100.0
    let bird: Bird
    let colour: SKColor

    init(bird: Bird, force: Force, color: SKColor) {
        self.force = force
        self.bird = bird
        self.colour = color
        label = SKLabelNode(text: "\(force.name) 0.0")
        label.fontColor = color
        label.fontSize = 12.0
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left

        sprite = SKShapeNode()
        sprite.strokeColor = color

        update()
    }

    func update() {
        sprite.hidden = !force.enabled
        label.hidden = !force.enabled

        if force.vector.length == 0 {
            sprite.hidden = true
            label.hidden = true
        }

        if force.enabled {
            sprite.position = CGPoint(x: bird.sprite.position.x, y: bird.sprite.position.y)
            sprite.path = linePath(force.vector.x, y: force.vector.y)
//            label.position = CGPoint(x: bird.sprite.position.x + bird.sprite.size.width, y: bird.sprite.position.y)
            label.text = "\(force.name) \(force.vector.prettyLength)"
        }
    }

    private

    func linePath(x: CGFloat, y: CGFloat) -> CGPathRef {
        let pathToDraw = CGPathCreateMutable()

        CGPathMoveToPoint(pathToDraw, nil, 0.0, 0.0)
        CGPathAddLineToPoint(pathToDraw, nil, x, y)

        return pathToDraw
    }
}
