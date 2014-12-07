//
//  DesignableView.swift
//  Spring
//
//  Created by Meng To on 2014-07-04.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
    didSet {
        layer.borderColor = borderColor.CGColor
    }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
        layer.borderWidth = borderWidth
    }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
        layer.cornerRadius = cornerRadius
    }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clearColor() {
    didSet {
        layer.shadowColor = shadowColor.CGColor
    }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
    didSet {
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSizeMake(1, 1)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        layer.shadowPath = UIBezierPath.bezierPathWithRect(layer.bounds).CGPath
    }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0 {
    didSet {
        layer.shadowOpacity = shadowOpacity
    }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}