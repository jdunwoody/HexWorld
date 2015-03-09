//
//  Created by James Dunwoody on 1/01/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import Foundation
import SpriteKit

class DebugForce
{
    let sprite: SKShapeNode
    let label: SKLabelNode

    let force: Force
    let TIME_INTERVAL:CGFloat = 100.0
    let bird: Bird

    init(bird: Bird, force: Force, color: SKColor) {
        self.force = force
        self.bird = bird
        label = SKLabelNode(text: force.name)
        label.fontColor = color
        label.fontSize = 12.0

        sprite = SKShapeNode()
        sprite.strokeColor = color

        update()
    }

    func update() {
        sprite.position = CGPoint(x: bird.sprite.position.x, y: bird.sprite.position.y)
        sprite.path = linePath(force.vector.x, y: force.vector.y)
        label.position = CGPoint(x: sprite.position.x, y: sprite.position.y)
    }

    private

    func linePath(x: CGFloat, y: CGFloat) -> CGPathRef {
        let pathToDraw = CGPathCreateMutable()

        CGPathMoveToPoint(pathToDraw, nil, 0.0, 0.0)
        CGPathAddLineToPoint(pathToDraw, nil, x, y)

        return pathToDraw
    }
}

//        SKShapeNode *yourline = [SKShapeNode node];
//        CGMutablePathRef pathToDraw = CGPathCreateMutable();
//        CGPathMoveToPoint(pathToDraw, NULL, 100.0, 100.0);
//        CGPathAddLineToPoint(pathToDraw, NULL, 50.0, 50.0);
//        yourline.path = pathToDraw;
//        [yourline setStrokeColor:[UIColor redColor]];
//        [self addChild:yourline];
//
//        let ctx = UIGraphicsGetCurrentContext()
//        let path = CGPathCreateMutable()
//        CGPathMoveToPoint(path, nil, 0, 0)
//        CGPathAddLineToPoint(path, nil, 0, 100)
//        CGPathCloseSubpath(path)
//        CGContextAddPath(ctx, path)
//        CGContextSetStrokeColorWithColor(ctx,UIColor.redColor().CGColor)
//        CGContextStrokePath(ctx)
//
//        sprite = SKShapeNode(path: path)
