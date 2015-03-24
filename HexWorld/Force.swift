//
//  Force.swift
//  HexWorld
//
//  Created by James Dunwoody on 8/03/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

import UIKit

class Force {
    let multiplier: CGFloat
    var enabled: Bool
    let name: String
    let calculator: ((bird:Bird, neighbours:[Bird], target:CGPoint) -> Vector2D)
    var vector: Vector2D

    init(name: String, multiplier: CGFloat, calculator: ((bird:Bird, neighbours:[Bird], target:CGPoint) -> Vector2D)) {
        self.name = name
        self.multiplier = multiplier
        self.calculator = calculator
        self.vector = Vector2D()

        if let setting = Settings()[self.name] {
            enabled = setting.enabled
        } else {
            enabled = false
        }
    }

    func calculate(bird: Bird, neighbours: [Bird], target: CGPoint) {
        self.vector = calculator(bird: bird, neighbours: neighbours, target: target) * multiplier
    }
}

