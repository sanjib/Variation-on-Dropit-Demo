//
//  SphereView.swift
//  Dropit
//
//  Created by Sanjib Ahmad on 2/27/16.
//  Copyright © 2016 Object Coder. All rights reserved.
//

import UIKit

class SphereView: UIView {

    // iOS 9 specific
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }

}
