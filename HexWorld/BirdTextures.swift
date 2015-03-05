//
//  Textures.swift
//  CrowControls
//
//  Created by James Dunwoody on 12/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import SpriteKit

class BirdTextures {
    let avatar: SKTexture
    let small: SKTexture
    let medium: SKTexture
    let large: SKTexture
    
    let flap: [SKTexture]
    let cruise: [SKTexture]
    
    init() {
        let atlas = SKTextureAtlas(named: "Birds.atlas")!
        
        self.avatar = atlas.textureNamed("YellowTriangle.png")
        self.small = SKTexture(imageNamed: "WhiteTriangle.png")
        self.medium = SKTexture(imageNamed: "BlueTriangle.png")
        self.large = SKTexture(imageNamed: "GreenTriangle.png")
        
        self.flap = [self.avatar]
        self.cruise = [self.avatar]
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
