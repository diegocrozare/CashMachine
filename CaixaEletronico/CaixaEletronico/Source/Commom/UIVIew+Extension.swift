//
//  UIVIew+Extension.swift
//  CaixaEletronico
//
//  Created by Diego William Crozare on 23/09/19.
//  Copyright © 2019 Diego William Crozare. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Set corner radius in view
    ///
    /// - Parameters:
    ///   - view: view
    ///   - radius: radius
    func setupCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
