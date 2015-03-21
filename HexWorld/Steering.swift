//
//  Steering.swift
//  CrowControls
//
//  Created by James Dunwoody on 30/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import Foundation
import SpriteKit
import Accelerate

class Steering {
    let world: World
    var forces: [Force] = []

    init(world: World) {
        self.world = world

        self.forces = [
                Force(name: "wallAvoidance", multiplier: 1.0, enabled: false, calculator: wallAvoidanceFunction()),
                Force(name: "obstacleAvoidance", multiplier: 1.0, enabled: false, calculator: obstacleAvoidanceFunction()),
                Force(name: "separation", multiplier: 10.0, enabled: true, calculator: separationFunction()),
                Force(name: "seek", multiplier: 1.0, enabled: true, calculator: seekFunction()),
                Force(name: "cohesion", multiplier: 1.0, enabled: true, calculator: cohesionFunction()),
        ]
    }

    func calculate(subject: Bird, neighbours: [Bird], flock: Flock) -> Vector2D {
        var steeringForceVector = Vector2D()

        //  flock.logPosition()

        for force in forces {
            if force.enabled {
                force.calculate(subject, neighbours: neighbours, target: flock.lead.sprite.position)

                if (!accumulateForce(&steeringForceVector, forceToAdd: force)) {
                    return steeringForceVector
                }
            }
        }
        return steeringForceVector
    }
    
    func accumulateForce(inout runningTotal: Vector2D, forceToAdd: Force) -> Bool {
        let maxForce: CGFloat = 5.0

        var magnitudeSoFar = runningTotal.length
        var magnitudeRemaining = maxForce - magnitudeSoFar

        if magnitudeRemaining <= 0.0 {
            return false
        }
        var magnitudeToAdd:CGFloat = forceToAdd.vector.length

        if magnitudeToAdd < magnitudeRemaining {
            runningTotal += forceToAdd.vector;
        } else {
            runningTotal += forceToAdd.vector.normalized * magnitudeRemaining
        }

        return true
    }

    func obstacleAvoidanceFunction() -> ((Bird, [Bird], CGPoint) -> Vector2D) {
        func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) -> (Vector2D) {
            return Vector2D()
        }

        return calculate
    }

    func wallAvoidanceFunction() -> ((Bird, [Bird], CGPoint) -> Vector2D) {
        func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) -> (Vector2D) {
            return Vector2D()
        }

        return calculate
    }

    func separationFunction() -> ((Bird, [Bird], CGPoint) -> Vector2D) {
        func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) -> (Vector2D) {
            var steeringForce = Vector2D()

            for neighbour in neighbours {

                if neighbour == bird {
                    continue
                }

                // this neighbour is not itself
                // this neighbour it tagged (near enough to this)
                let toAgent = Vector2D(point: bird.sprite.position - neighbour.sprite.position)

                //scale the force inversely proportional to the agent's distance from its neighbor.
                let newForce = toAgent.normalized / toAgent.length
                var newSteeringForce = steeringForce + newForce
                //            newSteeringForce += steeringForce + newForce
                steeringForce = steeringForce + newSteeringForce //bird.heading.normalized / toAgent.length
            }
            return steeringForce
        }

        return calculate
    }

    func cohesionFunction() -> ((Bird, [Bird], CGPoint) -> Vector2D) {
        func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) -> Vector2D {
            return seekFunction()(bird, neighbours, world.centreOfMass())
        }

        return calculate
    }

    func seekFunction() -> ((Bird, [Bird], CGPoint) -> Vector2D) {
        func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) -> Vector2D {
            let desiredVelocity: Vector2D = Vector2D(point: target) - Vector2D(point: bird.sprite.position)

            return desiredVelocity - bird.velocity
        }

        return calculate
    }

    func alignmentFunction() -> ((Bird, [Bird], CGPoint) -> Vector2D) {
        func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) -> Vector2D {
            //used to record the average heading of the neighbors
            var averageHeading = Vector2D()

            //used to count the number of vehicles in the neighborhood
            var neighbourCount = 0

            for neighbour in neighbours {
                //iterate through all the tagged vehicles and sum their heading vectors
                //make sure *this* agent isn't included in the calculations and that
                //the agent being examined is close enough
                var neighbourCount = 0
                if (neighbour != bird) {
                    averageHeading += neighbour.heading
                    neighbourCount++
                }
                var averageHeading = Vector2D()
                //if the neighborhood contained one or more vehicles, average their //heading vectors.
                if (neighbourCount > 0) {
                    averageHeading /= neighbourCount
                    averageHeading -= bird.heading
                }
            }
            return averageHeading
        }

        return calculate
    }

    func cohesion() -> ((Bird, [Bird], CGPoint) -> Vector2D) {
        func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) -> Vector2D {
            return Vector2D()
        }

        return calculate
    }

}
