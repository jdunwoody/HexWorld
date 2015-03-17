//
//  Textures.swift
//  CrowControls
//
//  Created by James Dunwoody on 12/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import SpriteKit

class BackgroundTextures {
    let hardObstacle: SKTexture
    let decorativeObstacle: SKTexture

    init() {
        hardObstacle = SKTexture(imageNamed: "BlackTriangle.png")!
        decorativeObstacle = SKTexture(imageNamed: "BlueTriangle.png")!
    }
}
