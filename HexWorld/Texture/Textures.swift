//
//  Textures.swift
//  HexWorld
//
//  Created by James Dunwoody on 21/02/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import Foundation
import SpriteKit

class Textures {
    let water: SKTexture
    let grass: SKTexture

    init() {
        let atlas = SKTextureAtlas(named: "Texture.atlas")!
        water = SKTexture(imageNamed: "Hex2dSmallWater.png")!
        grass = SKTexture(imageNamed: "Hex2dSmallGrass.png")!
    }
}
