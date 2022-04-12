//
//  GradientView.swift
//  Pokedex
//
//  Created by Thomas George on 11/04/2022.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var sideColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var centerColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    func updateColors() {
        gradientLayer.colors = [centerColor.cgColor, sideColor.cgColor]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.type = .radial
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        updateColors()
    }
    
}
