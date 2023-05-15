//
//  UIView+Extension.swift
//  Tech Test
//
//  Created by Ravi Seta on 15/05/23.
//

import UIKit

extension UIView {
    
    func setCorner(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func setBorder(width: CGFloat, color: UIColor = .lightGray) {
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
