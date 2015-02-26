//
//  GameScene.swift
//  HexWorld
//
//  Created by James Dunwoody on 21/02/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        let textures = Textures()
        let background = TiledBackground(textures: textures)
        
        let bird = Bird()
        
        for node in background.nodes {
            self.addChild(node)
        }
    }
    
    //    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    //        if let textures = self.texturesOpt {
    //            let hexNode = HexNode(textures: textures)
    //
    //            hexNode.position = CGPoint(x: self.size.width / 2.0, y: self.size.height / 2.0)
    //            self.addChild(hexNode)
    //        }
    //    }
    //
    //    override func update(currentTime: CFTimeInterval) {
    //        /* Called before each frame is rendered */
    //    }
}
