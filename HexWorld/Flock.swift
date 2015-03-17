import Foundation
import SpriteKit

class Flock: NSObject, SequenceType {

    let lead: Bird
    var birds: [Bird]

//    init(_ enumerator: NSEnumerator) {
//        self.enumerator = enumerator
//    }

    var sprites: [SKSpriteNode] {
        get {
            return birds.map {
                $0.sprite
            }
        }
    }

    init(world: World) {
        birds = [
                Bird(name: "Lead", world: world, textures: BirdTextures(atlas: SKTextureAtlas(named: "AvatarBird.atlas"))),
        ]

        for (var i = 0; i < Settings.initialNumberOfBirds; i++) {
            birds.append(Bird(name: "Bird\(i)", world: world, textures: BirdTextures(atlas: SKTextureAtlas(named: "SparrowBird.atlas"))))
        }

        lead = birds[0]
    }

    subscript(index: Int) -> Bird {
        return birds[index]
    }

    var size: Int {
        get {
            return self.birds.count
        }
    }

    func update(timeElapsed: CGFloat) {
        for bird in birds {
            if lead == bird {
                continue
            }
            bird.update(timeElapsed, flock: self)
        }
    }

    func neighbours(subject: Bird) -> [Bird] {
        var neighbours: [Bird] = []

        for bird in birds {
            if bird == subject {
                continue
            }

            if bird.nearTo(subject) {
                neighbours.append(bird)
            }
        }

        return neighbours
    }

    func configure(centre: CGPoint, maxYTranslation: CGFloat) {
        lead.configure(centre, maxYTranslation: maxYTranslation)

        for bird in birds {
            if bird == lead {
                continue
            }
            let x = CGFloat(arc4random_uniform(200))
            let y = CGFloat(arc4random_uniform(200))

            //            let x = CGFloat(200)
            //            let y = CGFloat(200)

            let birdOrigin = CGPoint(x: x, y: y)
            bird.configure(birdOrigin, maxYTranslation: maxYTranslation)
        }
    }

    func turningRight(percentage: CGFloat) {
        lead.turningRight(percentage)
        //        for bird in birds {
        //            bird.turningRight(percentage)
        //        }
    }

    func turningLeft(percentage: CGFloat) {
        lead.turningLeft(percentage)
        //        for bird in birds {
        //            bird.turningLeft(percentage)
        //        }
    }

    func straighten() {
        lead.straighten()
        //        for bird in birds {
        //            bird.straighten()
        //        }
    }

    func cruise() {
        lead.cruise()
        //        for bird in birds {
        //            bird.cruise()
        //        }
    }

    func accelerate(percentage: CGFloat) {
        lead.accelerate(percentage)
        //        for bird in birds {
        //            bird.accelerate(percentage)
        //        }
    }

    func decelerate(percentage: CGFloat) {
        lead.deccelerate(percentage)
        //        for bird in birds {
        //            bird.deccelerate(percentage)
        //        }
    }

    func steeringForce() {
        for bird in birds {
            let a = bird as Bird
            let b = birds[0] as Bird
            if a == b {
                continue
            }
            if bird == birds[0] {
                continue
            }
        }
    }

//    func next() -> Bird? {
//        return self.birds.generate()
//    }
//
//    func generate() -> GeneratorOf<Bird> {
//        return self.birds.generate()
//    }

//    private var cars = [Car]()

    func generate() -> GeneratorOf<Bird> {
        // keep the index of the next car in the iteration
        var nextIndex = self.birds.count - 1

        // Construct a GeneratorOf<Car> instance,
        // passing a closure that returns the next
        // car in the iteration
        return GeneratorOf<Bird> {
            if (nextIndex < 0) {
                return nil
            }
            return self.birds[nextIndex--]
        }
    }

}

func ==(left: Bird, right: Bird) -> Bool {
    return left.sprite == right.sprite
}
