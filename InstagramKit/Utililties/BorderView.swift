//
//  GradientBorderView.swift
//  InstagramKit
//
//  Created by Appernaut on 05/06/21.
//

import Foundation
import UIKit

enum BorderStatus: Int {
    case gradient = 0
    case normal
    case noBorder
}

class BorderView: UIView {
    private let gradientColors: [CGColor] = [UIColor.yellow.cgColor,
                                             UIColor(red: 252/255, green: 175/255, blue: 69/255, alpha: 1.0).cgColor,
                                             UIColor.red.cgColor,
                                             UIColor(red: 225/255, green: 48/255, blue: 108/255, alpha: 1.0).cgColor,
                                             UIColor(red: 193/255, green: 53/255, blue: 132/255, alpha: 1.0).cgColor,
                                             UIColor(red: 131/255, green: 58/255, blue: 180/255, alpha: 1.0).cgColor]
    
    private let greyColor: CGColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
    
    private lazy var gradientBorderLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        
        let mask = self.maskLayer
        mask.lineWidth = borderWidth
        mask.strokeColor = UIColor.white.cgColor
        mask.fillColor = UIColor.clear.cgColor
        layer.mask = mask
        layer.masksToBounds = true
        return layer
    }()
    
    private lazy var normalBorderLayer: CAShapeLayer = {
        let corner = self.bounds.width/2
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners,
                                      cornerRadii: CGSize(width: corner, height: corner)).cgPath

        //setup MASK
        self.layer.mask = nil
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path
        self.layer.mask = maskLayer

        //setup Border for Mask
        let borderLayer = CAShapeLayer()
        borderLayer.path = path
        maskLayer.lineWidth = borderWidth
        maskLayer.strokeColor = greyColor
        maskLayer.fillColor = UIColor.clear.cgColor
        borderLayer.frame = self.bounds

        return borderLayer
    }()

    public var borderWidth: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var borderStatus: BorderStatus = .gradient {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var maskLayer: CAShapeLayer = {
        let maskLayer = CAShapeLayer()
        let corner = self.bounds.width/2
        
        maskLayer.path = UIBezierPath(roundedRect: self.bounds.insetBy(dx: borderWidth, dy: borderWidth), byRoundingCorners: .allCorners,
                                      cornerRadii: CGSize(width: corner, height: corner)).cgPath
        return maskLayer
    }()
        
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        if let layers = layer.sublayers {
            if layers.contains(normalBorderLayer) {
                normalBorderLayer.removeFromSuperlayer()
            }
            else if layers.contains(gradientBorderLayer) {
                gradientBorderLayer.removeFromSuperlayer()
            }
        }
        
        if borderStatus == .gradient {
            layer.mask = nil
            layer.addSublayer(gradientBorderLayer)
            gradientBorderLayer.colors = gradientColors
            gradientBorderLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientBorderLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        }
        else if borderStatus == .normal {
            layer.addSublayer(normalBorderLayer)
        } else {
            layer.mask = nil
        }
    }
}
