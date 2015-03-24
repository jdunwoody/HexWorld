import Foundation
import SpriteKit

class Flock: NSObject, SequenceType {

    let lead: Bird
    var birds: [Bird]
    let scene: GameScene

    var sprites: [SKSpriteNode] {
        get {
            return birds.map {
                $0.sprite
            }
        }
    }

    init(scene: GameScene, centre: CGPoint) {
        self.scene = scene
        self.birds = [Bird(name: "Lead", weight: 1.0, textures: BirdTextures(atlas: SKTextureAtlas(named: "AvatarBird.atlas")), scene: scene)];

        self.lead = birds[0]

        super.init()

        for (var i = 0; i < Settings.numberOfBirds + 1; i++) {
            let bird = addBird("Bird\(i)")

            bird.sprite.position = CGPoint(x: CGFloat(arc4random_uniform(200)), y: CGFloat(arc4random_uniform(200)));
        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "settingsChanged", name: NSUserDefaultsDidChangeNotification, object: nil)
    }

    func addBird(name: String) -> Bird {
        let bird = Bird(name: name, weight: 1.0, textures: BirdTextures(atlas: SKTextureAtlas(named: "SparrowBird.atlas")), scene: self.scene)
        birds.append(bird)

        return bird
    }

    func settingsChanged() {
        if let numberOfBirdsSetting = Settings()["number_of_birds_preference"] {
            let newNumberOfBirds = numberOfBirdsSetting.intValue
            let currentNumberOfBirds = birds.count

            if newNumberOfBirds > currentNumberOfBirds {
                for i in (currentNumberOfBirds ... newNumberOfBirds) {
                    addBird("Bird\(i)")
                }
            } else {
                let birdsToRemoveRange = Range(start: newNumberOfBirds, end: currentNumberOfBirds)
                let birdsToRemove = birds[birdsToRemoveRange]

                for bird in birdsToRemove {
                    removeBird(bird)
                }
                birds.removeRange(birdsToRemoveRange)
            }
        }
    }

    func removeBird(bird: Bird) {
        bird.remove()
    }

    func logPosition() {
        NSLog("Flock position")

        for bird: Bird in birds {
            NSLog("\(bird.sprite.position)")
        }
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
