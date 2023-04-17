//
//  UIView_addSubViews.swift
//  Serioholic
//
//  Created by english on 2023-03-29.
//

import UIKit

extension UIView{
    
    // Variadic function
    func addSubviews( _ views : UIView... ) {
        
        for view in views {
            self.addSubview(view)
        }
        
    }
    
}
