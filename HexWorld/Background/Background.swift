//
//  TiledBackground.swift
//  HexWorld
//
//  Created by James Dunwoody on 24/02/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import UIKit
import Spritekit

class Background: NSObject {
    var nodes: [HexNode]
    let textures = BackgroundTextures()

    override init() {
        nodes = []
        //        var textureWidth = Int(textures.water.size().width)
        //        var textureHeight = Int(textures.water.size().height) * 2 / 3
        //
        //        for var y = 0; y < 10; y++ {
        //            for var x = 0; x < 10; x++ {
        //                let hexNode = HexNode(texture: (y % 2) == 0 ? textures.water : textures.grass)
        //                hexNode.position = CGPoint(x: x * textureWidth + (y % 2) * textureWidth / 2, y: y * textureHeight)
        //                nodes.append(hexNode)
        //            }
        //        }
        //
        super.init()
    }
}

//    CGSize coverageSize = CGSizeMake(2000,2000); //the size of the entire image you want tiled
//    CGRect textureSize = CGRectMake(0, 0, 100, 100); //the size of the tile.
//    CGImageRef backgroundCGImage = [UIImage imageNamed:@"image_to_tile"].CGImage; //change the string to your image name
//    UIGraphicsBeginImageContext(CGSizeMake(coverageSize.width, coverageSize.height));
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextDrawTiledImage(context, textureSize, backgroundCGImage);
//    UIImage *tiledBackground = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    SKTexture *backgroundTexture = [SKTexture textureWithCGImage:tiledBackground.CGImage];
//    SKSpriteNode *backgroundTiles = [SKSpriteNode spriteNodeWithTexture:backgroundTexture];
//    backgroundTiles.yScale = -1; //upon closer inspection, I noticed my source tile was flipped vertically, so this just flipped it back.
//    backgroundTiles.position = CGPointMake(0,0);
//    [self addChild:backgroundTiles];
