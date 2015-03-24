//
//  GameScene.swift
//  CrowControls
//
//  Created by James Dunwoody on 7/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene {
    var world: World?
    var userControlEnabled = true
    var flyingAnimationEnabled = true
    var background: Background
    var sceneStepAmount: Double

    override init(size: CGSize) {
        background = Background()
        sceneStepAmount = 45.0

        super.init(size: size)

        backgroundColor = SKColor.whiteColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(origin: CGPoint) {
        world = World(bounds: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height), scene: self);
    }

    override func update(newTime: CFTimeInterval) {
        let elapsedTime: CGFloat = CGFloat(self.sceneStepAmount) //CGFloat(newTime - oldTime)

        if let theWorld = world {
            theWorld.update(elapsedTime)
        }
    }

    func pannedLeft(percentage: CGFloat) {
        if userControlEnabled {
            if let theWorld = world {
                theWorld.flock.turningLeft(percentage)
            }
        }
    }

    func pannedRight(percentage: CGFloat) {
        if userControlEnabled {
            if let theWorld = world {
                theWorld.flock.turningRight(percentage)
            }
        }
    }

    func stoppedHorizontalPanning() {
        if userControlEnabled {
            if let theWorld = world {
                theWorld.flock.straighten()
            }
        }
    }

    func stoppedVerticalPanning() {
        if userControlEnabled {
            if let theWorld = world {
                theWorld.flock.cruise()
            }
        }
    }

    func pannedForward(percentage: CGFloat) {
        if userControlEnabled {
            if let theWorld = world {
                theWorld.flock.accelerate(min(1.0, percentage))
            }
        }
    }

    func pannedBackward(percentage: CGFloat) {
        if userControlEnabled {
            if let theWorld = world {
                theWorld.flock.decelerate(min(1.0, percentage))
            }
        }
    }

    override func didMoveToView(view: SKView) {
        //        self.world.size =CGRect(origin: CGPointZero, size: <#CGSize#>) view.frame
        //
        //        flock.configure(Vector2D(point: view.center), maxYTranslation : maxYTranslation)
        //        debugControls.position = CGPoint(x: view.center.x, y: 0.0)
        //
        //
        //        for sprite in flock.sprites {
        //            addChild(sprite)
        //        }
        //
        //        if Settings.flyingEnabled {
        //            if flyingAnimationEnabled {
        //                flock.cruise()
        //            }
        //        }
        //        debugControls.position = CGPoint(x: view.center.x, y: 0.0)
        //        addChild(debugControls)
        //
        //        addChild(debugSteering.sprite)
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)

            if let theWorld = world {
                theWorld.flock.lead.sprite.position = location
            }
        }
    }

}
