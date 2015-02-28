//
//  World.swift
//  CrowControls
//
//  Created by James Dunwoody on 2/01/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import Foundation
import SpriteKit

class World
{
    let debugSteering = DebugSteering()
    
    var size = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
    var centre = CGPoint(x: 200.0, y: 200.0)
    
    var flock: Flock?
    
    init() {
        
    }
    //    init(flock: Flock) {
    //        self.flock = flock
    //    }
    
    func update(timeElapsed: CGFloat) {
        flock!.update(timeElapsed)
        
        let centre = centreOfMass()
        
        debugSteering.centreOfMass = centre
    }
    
    func clipX(newX: CGFloat) -> CGFloat {
        var x = newX > self.size.maxX - 20 ? self.size.maxX - 20 : newX
        x = newX < self.size.minX + 20 ? self.size.minX + 20 : newX
        
        return x
    }
    
    func clipY(newY: CGFloat) -> CGFloat {
        var y = newY > self.size.maxY - 20 ? self.size.maxY - 20 : newY
        y = newY < self.size.minY + 20 ? self.size.minY + 20 : newY
        
        return y;
    }
    
    func centreOfMass() -> CGPoint {
        var centreOfMassVector = Vector2D()
        
        for bird in flock!.birds {
            centreOfMassVector = centreOfMassVector + bird.sprite.position
        }
        
        centreOfMassVector /= flock!.birds.count
        
        return centreOfMassVector.point
    }
    
    //    init(x: CGFloat, y: CGFloat) {
    //        self.x = x
    //        self.y = y
    //    }
}