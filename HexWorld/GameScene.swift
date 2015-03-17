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
    var flock: Flock
    var world: World
    var maxYTranslation = 200.0 as CGFloat
    var userControlEnabled = true
    var flyingAnimationEnabled = true
    var background: Background
    var sceneStepAmount: Double

    required init?(coder: NSCoder) {
        world = World(bounds: CGRectZero)
        flock = Flock(world: world)
        world.flock = flock
        background = Background()
        sceneStepAmount = 0

        super.init(coder: coder)

        addChildren()
    }

    override init(size: CGSize) {
        world = World(bounds: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        flock = Flock(world: world)
        world.flock = flock
        background = Background()
        sceneStepAmount = 0

        super.init(size: size)

        backgroundColor = SKColor.whiteColor()

        world.bounds = CGRect(origin: CGPointZero, size: size)
    }

    func addChildren() {
        for bird in flock.birds {
            addChild(bird.sprite)

            for debugForce in bird.debug!.debugForces {
                debugForce.sprite.position = bird.sprite.position
                addChild(debugForce.sprite)
                addChild(debugForce.label)
            }
        }

//        for sprite in flock.sprites {
//            addChild(sprite)
//        }

        if Settings.flyingEnabled {
            if flyingAnimationEnabled {
                flock.cruise()
            }
        }
    }

    func configure(origin: CGPoint, maxYTranslation: CGFloat) {
        //        self.flock.origin = Vector2D(point: origin)
        self.maxYTranslation = maxYTranslation


        flock.configure(CGPoint(x: world.bounds.size.width / 2.0, y: world.bounds.size.height / 2.0), maxYTranslation: maxYTranslation)
        //        debugControls.position = CGPoint(x: world.bounds.size.width / 2.0, y: 0.0)
        addChildren()

    }

    override func update(newTime: CFTimeInterval) {
        let elapsedTime: CGFloat = CGFloat(self.sceneStepAmount) //CGFloat(newTime - oldTime)

        world.update(elapsedTime)
    }

    func pannedLeft(percentage: CGFloat) {
        if userControlEnabled {
            flock.turningLeft(percentage)
        }
    }

    func pannedRight(percentage: CGFloat) {
        if userControlEnabled {
            flock.turningRight(percentage)
        }
    }

    func stoppedHorizontalPanning() {
        if userControlEnabled {
            flock.straighten()
        }
    }

    func stoppedVerticalPanning() {
        if userControlEnabled {
            flock.cruise()
        }
    }

    func pannedForward(percentage: CGFloat) {
        if userControlEnabled {
            flock.accelerate(min(1.0, percentage))
        }
    }

    func pannedBackward(percentage: CGFloat) {
        if userControlEnabled {
            flock.decelerate(min(1.0, percentage))
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

            self.flock.lead.sprite.position = location
        }
    }
}
