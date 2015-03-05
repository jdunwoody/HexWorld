//
//  BirdSprite.swift
//  CrowControls
//
//  Created by James Dunwoody on 11/12/2014.
//  Copyright (c) 2014 James Dunwoody. All rights reserved.
//

import SpriteKit

class BirdSprite: SKSpriteNode {
    
    init(actions : BirdActions, textures : BirdTextures) {
        super.init(texture: textures.avatar, color: UIColor.clearColor(), size: textures.avatar.size())
    }
    
    //    convenience init(texture: SKTexture!) {
    //        self.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
    //    }
    
    //    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
    //        textures = Textures().birdTextures()
    //
    //        super.init(texture: texture, color: color, size: size)
    //
    //    }
    
    required init?(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}