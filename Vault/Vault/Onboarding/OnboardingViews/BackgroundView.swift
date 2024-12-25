//
//  BackgroundView.swift
//  Vault
//
//  Created by Thang Hoang on 24/12/24.
//

import UIKit

final class BackgroundView: UIView {
    
    private let topColor: UIColor = UIColor.Purple
    private let bottomColor: UIColor = UIColor.lightPurple
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = bounds
        gradientLayer.type = .axial
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.5, y: 2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
}
