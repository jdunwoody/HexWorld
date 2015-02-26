//
//  File.swift
//  HexWorld
//
//  Created by James Dunwoody on 21/02/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import Foundation
import SpriteKit

class HexNode: SKSpriteNode
{
    init(texture : SKTexture) {
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
    }
    
    required init?(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}
