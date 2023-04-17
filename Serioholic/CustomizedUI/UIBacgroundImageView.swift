//
//  UIBacgroundImageView.swift
//  Serioholic
//
//  Created by Baneet Bali on 2023-04-07.
//

import Foundation
import UIKit
class UIBackgroundImageView : UIImageView{
    
    public var backgroundImg : UIImage?{
        didSet{
            backgroundImageView.image = UIImage(named: "backimage")
        }
    }
    
    private let backgroundImageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
