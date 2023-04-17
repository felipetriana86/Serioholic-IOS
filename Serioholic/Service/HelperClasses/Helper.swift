//
//  Helper.swift
//  Serioholic
//
//  Created by english on 2023-04-05.
//

import UIKit
class Helper : UIView{
    
    static public func defaultLabel( text : String, fontSize : CGFloat) -> UILabel {
        
        let lbl = UILabel()
        lbl.text = text
        lbl.font = .systemFont(ofSize: fontSize, weight : .semibold)
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    static public func defaultImage(tintColor : UIColor) -> UIImageView {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.tintColor = tintColor
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }
    
    static public func defaultParagraph( text : String, fontSize : CGFloat) -> UILabel {
        
        let lbl = UILabel()
        lbl.text = text
        lbl.font = .systemFont(ofSize: fontSize, weight : .semibold)
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.numberOfLines = 10
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
}
