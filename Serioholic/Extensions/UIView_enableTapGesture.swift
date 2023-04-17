//
//  UIView_enableTapGesture.swift
//  Serioholic
//
//  Created by english on 2023-04-05.
//

import UIKit

extension UIView {
    
    func enableTapGestureRecognizer(target: Any?, action: Selector?){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
        
    }
    
}

