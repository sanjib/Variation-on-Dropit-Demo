//
//  DropitBehavior.swift
//  Dropit
//
//  Created by Sanjib Ahmad on 1/12/16.
//  Copyright © 2016 Object Coder. All rights reserved.
//

import UIKit

class DropitBehavior: UIDynamicBehavior {
    let gravity = UIGravityBehavior()
    
    lazy var collidor: UICollisionBehavior = {
        let lazilyCreatedCollidor = UICollisionBehavior()
        lazilyCreatedCollidor.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollidor
    }()
    
    lazy var dropBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedDropBehavior = UIDynamicItemBehavior()
        lazilyCreatedDropBehavior.allowsRotation = true
        lazilyCreatedDropBehavior.elasticity = 0.5
        lazilyCreatedDropBehavior.friction = 0
        lazilyCreatedDropBehavior.resistance = 0
        return lazilyCreatedDropBehavior
    }()
    
    lazy var fieldBehavior: UIFieldBehavior = {
        let lazilyCreatedFieldBehavior = UIFieldBehavior.noiseFieldWithSmoothness(1.0, animationSpeed: 0.5)
        lazilyCreatedFieldBehavior.strength = 1.5
        return lazilyCreatedFieldBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collidor)
        addChildBehavior(dropBehavior)
        addChildBehavior(fieldBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collidor.removeBoundaryWithIdentifier(name)
        collidor.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addDrop(drop: UIView) {
        dynamicAnimator?.referenceView?.addSubview(drop)
        gravity.addItem(drop)
        collidor.addItem(drop)
        dropBehavior.addItem(drop)
        fieldBehavior.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        gravity.removeItem(drop)
        collidor.removeItem(drop)
        dropBehavior.removeItem(drop)
        fieldBehavior.removeItem(drop)
        drop.removeFromSuperview()
    }
}
