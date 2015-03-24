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

class Steering: NSObject {
    var forces: [Force] = []

    override init() {
        self.forces = []

        super.init()

        self.forces += [
                Force(name: "wallAvoidance", multiplier: 1.0, calculator: wallAvoidanceFunction()),
                Force(name: "obstacleAvoidance", multiplier: 1.0, calculator: obstacleAvoidanceFunction()),
                Force(name: "separation", multiplier: 1.0, calculator: separationFunction()),
                Force(name: "seek", multiplier: 1.0, calculator: seekFunction()),
                Force(name: "cohesion", multiplier: 1.0, calculator: cohesionFunction()),
        ]

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "settingsChanged", name: NSUserDefaultsDidChangeNotification, object: nil)
    }

    func settingsChanged() {
        let settings = Settings()
        for force in forces {
            if let setting = settings[force.name] {
                force.enabled = setting.enabled
                NSLog("force \(force.name) is enabled \(force.enabled)")
            } else {
                NSLog("no setting for \(force.name)")

            }
        }
    }

    func calculate(subject: Bird, neighbours: [Bird], flock: Flock) -> Vector2D {
        var steeringForceVector = Vector2D()

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
        runningTotal += forceToAdd.vector

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
            let centreOfMass = CGPoint(x: 100.0, y: 100.0)
            return seekFunction()(bird, neighbours, centreOfMass)
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
