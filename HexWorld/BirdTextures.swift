//
//  Created by James Dunwoody on 12/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import SpriteKit

class BirdTextures {
    let initial: SKTexture
    let flap: [SKTexture]
    let cruise: [SKTexture]
    let atlas: SKTextureAtlas

    init(atlas: SKTextureAtlas) {
        self.atlas = atlas

        self.initial = atlas.textureNamed("initial.png")
        let flap1 = atlas.textureNamed("flap1.png")
        let cruise1 = SKTexture(imageNamed: "cruise1.png")
        let turn1 = SKTexture(imageNamed: "turn1.png")
        let die1 = SKTexture(imageNamed: "die1.png")

        self.flap = [flap1]
        self.cruise = [cruise1]
    }
}

//    init() {
//        self.flap = []
//        self.cruise = []

//        let atlas = SKTextureAtlas(named: "Birds.atlas")!

//        self.avatar = SKTexture(imageNamed: "YellowTriangle.png")

//            for i in 1...3 {
//                if let texture = SKTexture(imageNamed: "bird-\(i).png") {
//                    self.flap.append(texture)
//                }
//            }
//            self.cruise.append(self.flap[0])
//        }
//    }
//    }

//    func flapping(flapCount : Int, glideCount : Int) -> [SKTexture] {
//
//        return flap + cruise + cruise + cruise  + cruise + cruise + cruise  + cruise + cruise + cruise  + cruise + cruise + cruise  + cruise + cruise + cruise
//    }
//}
