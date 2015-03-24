import Foundation
import UIKit
import SpriteKit

class Bird {
    let velocity: Vector2D
    let heading: Vector2D
    let side: Vector2D
    let mass: CGFloat
    let maxSpeed: CGFloat
    let maxForce: CGFloat
    let maxTurnRate: CGFloat

    let steering: Steering
    let actions: BirdActions
    let sprite: BirdSprite
    let debug: Debug?
    let name: String
    let weight: CGFloat

    init(name: String, weight: CGFloat,textures: BirdTextures, scene:GameScene) {
        self.name = name
        self.weight = weight
        self.steering = Steering()
        self.actions = BirdActions(textures: textures)
        self.sprite = BirdSprite(actions: self.actions, textures: textures)
        self.heading = Vector2D(x: 0, y: 1.0)
        self.velocity = Vector2D()
        self.side = Vector2D().rotate(90.0)
        self.mass = 1000.0
        self.maxSpeed = 10.0
        self.maxForce = 10.0
        self.maxTurnRate = 10.0

        scene.addChild(sprite)

        self.sprite.position = CGPoint(x: 100.0, y: 100.0)

        self.debug = Debug(steering: steering, bird: self)
    }

    func remove()
    {
        sprite.removeFromParent()
        debug!.remove()
    }

    //    func fly()
    //    {
    //        self.sprite.runAction(actions.flappingBird(textures), withKey: "flapping")
    //    }

    func cruise() {
        sprite.removeActionForKey("flying")
        sprite.runAction(actions.fly(0.5), withKey: "flying")
//        sprite.runAction(SKAction.moveTo(world.centre, duration: 0.2))
        //        sprite.removeActionForKey("advancing")
        //        sprite.removeActionForKey("decelerating")
    }

    func accelerate(percentage: CGFloat) {
//        sprite.removeActionForKey("flying")
//        let amount = world.centre.y - percentage
//
//        self.sprite.position.y = self.world.clipY(amount)
//
//        sprite.runAction(actions.fly(percentage), withKey: "flying")
    }

    func deccelerate(percentage: CGFloat) {
//        sprite.removeActionForKey("flying")
//        let amount = world.centre.y + percentage
//        self.sprite.position.y = self.world.clipY(amount)
//
//        sprite.runAction(actions.fly(percentage), withKey: "flying")
    }

    func straighten() {
        //        self.sprite.zRotation = 0.0

        //        sprite.removeActionForKey("turningLeft")
        //        sprite.removeActionForKey("turningRight")
        sprite.runAction(SKAction.rotateToAngle(0.0, duration: 0.2))
    }

    func turningRight(percentage: CGFloat) {
        self.sprite.zRotation = -percentage * CGFloat(M_PI)

        //        straighten()
        //        let turningRight = self.actions.turningRight(amount)

        //        self.sprite.runAction(turningRight, withKey: "turningRight")
    }

    func turningLeft(percentage: CGFloat) {
        self.sprite.zRotation = CGFloat(percentage * CGFloat(M_PI))

        //        straighten()
        //        let turningLeft = actions.turningLeft(percentage)
        //
        //        sprite.runAction(turningLeft, withKey: "turningLeft")
    }

    func nearTo(bird: Bird) -> Bool {
        //        if bird.position ==
        return true
    }

    func update(timeElapsed: CGFloat, flock: Flock) {

        let force = steering.calculate(self, neighbours: flock.neighbours(self), flock: flock)

        //        if let forceLine = debugForceLine {
        //            forceLine.update(force)
        //        }

        //        let angle = atan2(force.y, force.x)
        //        let p:CGPoint = self.sprite.position
        //        let f:CGPoint = force.point
        //        self.sprite.position = p + f
        //        self.sprite.position = self.sprite.position + force
        //        self.heading += force
        //        self.sprite.zRotation = angle

        let acceleration = force / mass
        velocity += acceleration * timeElapsed
        velocity.truncate(maxSpeed)

        self.sprite.position = self.sprite.position + velocity * timeElapsed / 1000.0

        if velocity.lengthSquared > 0.00000001 {
            heading.update(velocity.normalized)
            side.update(heading.perpendicular)
        }

        self.debug!.update()
    }

    //    func normalFlappingAnimation() -> SKAction {
    //        return flappingAnimation(0.5)
    //    }
    //
    //    func fastFlappingAnimation() -> SKAction {
    //        return flappingAnimation(0.1)
    //    }
    //
    //    func slowFlappingAnimation() -> SKAction {
    //        return flappingAnimation(1.0)
    //    }

    //    private
    //
    //    func flappingAnimation(timePerFrame: NSTimeInterval) -> SKAction {
    //        return SKAction.animateWithTextures(self.textures, timePerFrame: 0.1, resize: false, restore: true)
    //    }

}
